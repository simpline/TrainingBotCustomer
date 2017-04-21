FROM node:latest

MAINTAINER Daisuke Miura <miura.daisuke@simpline.co.jp>

RUN npm install -g coffee-script yo generator-hubot
RUN npm install hubot-slack --save
RUN useradd hubot
RUN mkdir /home/hubot && chown hubot.hubot /home/hubot

USER hubot
WORKDIR /home/hubot
RUN yo hubot --owner "miura" --name "customer" \
      --description "Customer in Training" \
      --adapter slack

COPY ./scripts scripts

ENV HUBOT_SLACK_TOKEN $MYHUBOT_SLACK_TOKEN

EXPOSE 9999

CMD cd /bot; bin/hubot --adapter slack
