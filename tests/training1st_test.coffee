Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/training1st.coffee')

describe 'The 1st day of Training', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'should reply greeting to trainee', ->
    @room.user.say('miura', '@hubot 三浦と申します。監視ソフトウェアの構築をしていました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot 三浦と申します。監視ソフトウェアの構築をしていました。']
        ['hubot', '@miura はじめまして、三浦さん。これからよろしくお願いします。']
      ]
