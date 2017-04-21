FROM node:latest

MAINTAINER Daisuke Miura <miura.daisuke@simpline.co.jp>

RUN npm install -g yo generator-hubot hubot-slack --save
RUN useradd hubot
RUN mkdir /home/hubot && chown hubot.hubot /home/hubot

USER hubot
WORKDIR /home/hubot
RUN yo hubot --owner "miura" --name "customer" \
      --description "Customer in Training" \
      --adapter slack

COPY ./scripts scripts
COPY ./test test

RUN npm install mocha chai hubot-test-helper --save-dev

ENV HUBOT_SLACK_TOKEN ${MYHUBOT_SLACK_TOKEN}

EXPOSE 9999

CMD bin/hubot --adapter slack
