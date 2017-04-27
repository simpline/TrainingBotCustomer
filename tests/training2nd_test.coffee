Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/training2nd.coffee')

describe 'The 2nd week of Training', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'should instruct building wordpress', ->
    @room.user.say('miura', '@hubot ご用件を伺いに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot ご用件を伺いに来ました。']
        ['hubot', '@miura 実は最近会社でもブログを使っている所が増えていると聞いてね。そこで当社もブログを使って、当社の良さを宣伝したいと思っているんだ。なので、早速なんだけど、Wordpressがいいらしいので、それをひとつ用意してくれるかね。']
        ['hubot', '@miura 上長に「お客様からWordpressを立ててほしいと頼まれました。」と相談してください。']
      ]

  it 'should instruct changing blog from wordpress to MovableType', ->
    @room.user.say('miura', '@hubot Wordpressを立てたことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot Wordpressを立てたことを報告しに来ました。']
        ['hubot', '@miura ありがたいのですが、昨日Wordpressでブログを書いてほしいと社員に伝えたら、MovableTypeの方がいいと言い出す社員がいましてね。そちらのが慣れているから楽だという話なんですよ。私としては書いてもらえば、どちらでもいいのでMovableTypeにしてもらえますか。']
        ['hubot', '@miura 上長に「お客様からMovableTypeに変更してほしいと頼まれました。」と相談してください。']
      ]

  it 'should instruct rebuilding Wordpress', ->
    @room.user.say('miura', '@hubot MovableTypeに変更したことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot MovableTypeに変更したことを報告しに来ました。']
        ['hubot', '@miura いやー、変えてもらったところを申し訳ないんだけどね。やはりWordpressのがよさそうで、Wordpressにしてほしいんだよ。MovableTypeがいいと言っていた社員もブログを書くだけでサーバを運用するわけじゃないから、口出さないように言っておいたよ。それでは、よろしく。']
        ['hubot', '@miura 上長に「お客様からWordpressに戻して100万PVに耐えられるようにしてほしいと頼まれました。」と相談してください。']
      ]

  it 'should instruct scheduling a backup for Wordpress', ->
    @room.user.say('miura', '@hubot Wordpressに戻したことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot Wordpressに戻したことを報告しに来ました。']
        ['hubot', '@miura じゃあ、早速使ってみますよ。それと、せっかく書いたのに消えてしまってはいやだから、バックアップをとれるようにしておいてください。']
        ['hubot', '@miura 上長に「お客様からバックアップを取るように頼まれました。」と相談してください。']
      ]

  it 'should instruct restoring Wordpress', ->
    @room.user.say('miura', '@hubot 障害とその原因について報告しに来ました。障害の原因はプロセスが停止したことによるものでした。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot 障害とその原因について報告しに来ました。障害の原因はプロセスが停止したことによるものでした。']
        ['hubot', '@miura そういうことですか。バックアップを取ってあるので、すぐ戻せますよね。すぐに取りかかってください。戻ったら、私に「復旧したことを報告しに来ました。」と言いに来てください。']
      ]

  it 'should instruct setting monitoring', ->
    @room.user.say('miura', '@hubot 復旧したことを報告しに来ました。プロセスを再起動したことで正常に動作しました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot 復旧したことを報告しに来ました。プロセスを再起動したことで正常に動作しました。']
        ['hubot', '@miura ご苦労様です。復旧したことですし、とりあえずよしとしましょう。ただ、こちらが気づく前に、そちらで気づかないようでは困りますね。あらかじめそちらで気づくような仕組みを作っておいてください。']
        ['hubot', '@miura 上長に「お客様から壊れたことを気づく仕組みを作ってほしいと頼まれました。」と相談してください。']
      ]
