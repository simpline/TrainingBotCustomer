#!/usr/bin/env bash

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

configure_aws_cli(){
    aws --version
    aws configure set default.region ap-northeast-1
    aws configure set default.output json
}

deploy_cluster() {

    family="bot-customer"

    make_task_def
    register_definition
    if [[ $(aws ecs update-service --cluster bot-customer --service bot-customer-service --task-definition $revision | \
                   $JQ '.service.taskDefinition') != $revision ]]; then
        echo "Error updating service."
        return 1
    fi

    # wait for older revisions to disappear
    # not really necessary, but nice for demos
    for attempt in {1..30}; do
        if stale=$(aws ecs describe-services --cluster bot-customer --services bot-customer-service | \
                       $JQ ".services[0].deployments | .[] | select(.taskDefinition != \"$revision\") | .taskDefinition"); then
            echo "Waiting for stale deployments:"
            echo "$stale"
            sleep 5
        else
            echo "Deployed!"
            return 0
        fi
    done
    echo "Service update took too long."
    return 1
}

make_task_def(){
    task_template='[
        {
            "name": "traningbot",
            "image": "%s.dkr.ecr.ap-northeast-1.amazonaws.com/bot/customer:%s",
            "essential": true,
            "memory": 128,
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 8080
                }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "trainingbot",
                    "awslogs-region": "ap-northeast-1",
                    "awslogs-stream-prefix": "customer"
                }
            },
            "environment": [
                { "name": "HUBOT_SLACK_TOKEN", "value": "%s" }
            ]
        }
    ]'

    task_def=$(printf "$task_template" $AWS_ACCOUNT_ID $CIRCLE_SHA1 $MYHUBOT_SLACK_TOKEN)
}

push_ecr_image(){
    eval $(aws ecr get-login --region ap-northeast-1)
    docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/bot/customer:$CIRCLE_SHA1
}

register_definition() {

    if revision=$(aws ecs register-task-definition --container-definitions "$task_def" --family $family | $JQ '.taskDefinition.taskDefinitionArn'); then
        echo "Revision: $revision"
    else
        echo "Failed to register task definition"
        return 1
    fi

}

configure_aws_cli
push_ecr_image
deploy_cluster
