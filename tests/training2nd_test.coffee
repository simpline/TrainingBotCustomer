Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/training2nd.coffee')

describe 'The 2nd week of Training', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'should instruct trainee to build Wordpress', ->
    @room.user.say('miura', '@hubot ご用件を伺いに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot ご用件を伺いに来ました。']
        ['hubot', '@miura 実は最近会社でもブログを使っている所が増えていると聞いてね。\nそこで当社もブログを使って、当社の良さを宣伝したいと思っているんだ。\nなので、早速なんだけど、Wordpressがいいらしいので、それをひとつ用意してくれるかね。\n上長に「お客様からWordpressを立ててほしいと頼まれました。」と相談してくだ さい。']
      ]

  it 'should instruct trainee to change blog from Wordpress to MovableType', ->
    @room.user.say('miura', '@hubot Wordpressを立てたことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot Wordpressを立てたことを報告しに来ました。']
        ['hubot', '@miura ありがたいのですが、昨日Wordpressでブログを書いてほしいと社員に伝えたら、\nMovableTypeの方がいいと言い出す社員がいましてね。\nそちらのが慣れているから楽だという話なんですよ。\n私としては書いてもらえば、どちらでもいいのでMovableTypeにしてもらえますか。\n上長に「お客様からMovableTypeに変更してほしいと頼まれました。」と相談して ください。']
      ]

  it 'should instruct trainee to rebuild Wordpress', ->
    @room.user.say('miura', '@hubot MovableTypeに変更したことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot MovableTypeに変更したことを報告しに来ました。']
        ['hubot', '@miura いやー、変えてもらったところを申し訳ないんだけどね。\nやはりWordpressのがよさそうで、Wordpressにしてほしいんだよ。\nMovableTypeがいいと言っていた社員もブログを書くだけでサーバを運用するわけじゃないからn口出さないように言っておいたよ。それでは、よろしく。\n上長に「お客様からWordpressに戻して100万PVに耐えられるようにしてほしいと頼まれました。」と相談してください。']
      ]

  it 'should instruct trainee to schedule a backup for Wordpress', ->
    @room.user.say('miura', '@hubot Wordpressに戻したことを報告しに来ました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot Wordpressに戻したことを報告しに来ました。']
        ['hubot', '@miura じゃあ、早速使ってみますよ。\nそれと、せっかく書いたのに消えてしまってはいやだから、\nバックアップをとれるようにしておいてください。\n上長に「お客様からバックアップを取るように頼まれました。」と相談してください。']
      ]

  it 'should instruct restoring Wordpress', ->
    @room.user.say('miura', '@hubot 障害内容とその原因について報告しに来ました。障害の原因はプロセスが停止したことによるものでした。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot 障害内容とその原因について報告しに来ました。障害の原因はプロセスが停止したことによるものでした。']
        ['hubot', '@miura そういうことですか。バックアップを取ってあるので、すぐ戻せますよね。\nすぐに取りかかってください。\n戻ったら、私に「復旧したことを報告しに来ました。」と言いに来てください。']
      ]

  it 'should instruct setting monitoring', ->
    @room.user.say('miura', '@hubot 復旧したことを報告しに来ました。プロセスを再起動したことで正常に動作しました。').then =>
      expect(@room.messages).to.eql [
        ['miura', '@hubot 復旧したことを報告しに来ました。プロセスを再起動したことで正常に動作しました。']
        ['hubot', '@miura ご苦労様です。復旧したことですし、とりあえずよしとしましょう。\nただ、こちらが気づく前に、そちらで気づかないようでは困りますね。\nあらかじめそちらで気づくような仕組みを作っておいてください。\n上長に「お客様から壊れたことを気づく仕組みを作ってほしいと頼まれました。」と\n相談してください。']
      ]
