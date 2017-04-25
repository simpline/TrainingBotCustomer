FROM node:alpine

MAINTAINER Daisuke Miura <miura.daisuke@simpline.co.jp>

RUN npm install -g coffee-script yo generator-hubot hubot-slack --save
RUN adduser -S hubot

USER hubot
WORKDIR /home/hubot
RUN yo hubot --owner "miura" --name "customer" \
      --description "Customer in Training" \
      --adapter slack

RUN npm install mocha chai hubot-test-helper --save-dev

ENV NODE_PATH /usr/local/lib/node_modules

COPY ./scripts scripts
COPY ./tests tests

EXPOSE 8080

CMD bin/hubot --adapter slack
