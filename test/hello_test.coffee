Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/hello.coffee')

describe 'example script', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'say HELLO', ->
    @room.user.say('alice', 'HELLO').then =>
      expect(@room.messages).to.eql [
        ['alice', 'HELLO']
        ['hubot', 'Hi']
      ]
