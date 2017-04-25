Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/hello.coffee')

describe 'Training 1', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'start Training 1', ->
    @room.user.say('miura', '@customer 三浦と申します。監視ソフトウェアの構築をしていました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@customer 三浦と申します。監視ソフトウェアの構築をしていました。']
        ['hubot', '@miura はじめまして、三浦さん。これからよろしくお願いします。']
      ]
