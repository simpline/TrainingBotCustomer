# Description:
#   The 2nd day of Training - 研修2日目
#
# Commands:
#   customer ご用件を伺いに来ました。
#   customer Wordpressを立てたことを報告しに来ました。
#   customer MovableTypeに変更したことを報告しに来ました。
#   customer Wordpressに戻したことを報告しに来ました。
#   customer 障害とその原因について報告しに来ました。{障害内容と原因}
#   customer 復旧したことを報告しに来ました。

module.exports = (robot) ->
  robot.respond /ご用件を伺いに来ました。/i, (res) ->
    res.reply "実は最近会社でもブログを使っている所が増えていると聞いてね。そこで当社もブログを使って、当社の良さを宣伝したいと思っているんだ。なので、早速なんだけど、Wordpressがいいらしいので、それをひとつ用意してくれるかね。"
    res.send "「@boss お客様からWordpressを立ててほしいと頼まれました。」の形式です。"

  robot.respond /Wordpressを立てたことを報告しに来ました。/i, (res) ->
    res.reply "ありがたいのですが、昨日Wordpressでブログを書いてほしいと社員に伝えたら、MovableTypeの方がいいと言い出す社員がいましてね。そちらのが慣れているから楽だという話なんですよ。私としては書いてもらえば、どちらでもいいのでMovableTypeにしてもらえますか。"
    res.send "「@boss お客様からMovableTypeに変更してほしいと頼まれました。」の形式です。"

  robot.respond /MovableTypeに変更したことを報告しに来ました。/i, (res) ->
    res.reply "いやー、変えてもらったところを申し訳ないんだけどね。やはりWordpressのがよさそうで、Wordpressにしてほしいんだよ。MovableTypeがいいと言っていた社員もブログを書くだけでサーバを運用    するわけじゃないから、口出さないように言っておいたよ。それでは、よろしく。"
    res.send "「@boss お客様からWordpressに戻して100万PVに耐えられるようにしてほしいと頼まれました。」の形式です。"

  robot.respond /Wordpressに戻したことを報告しに来ました。/i, (res) ->
    res.reply "じゃあ、早速使ってみますよ。それと、せっかく書いたのに消えてしまってはいやだか、バックアップをとれるようにしておいてください。"
    res.send "「@boss お客様からバックアップを取るように頼まれました。」の形式です。"

  robot.respond /障害とその原因について報告しに来ました。.*/i, (res) ->
    res.reply "そういうことですか。バックアップを取ってあるので、すぐ戻せますよね。すぐに取りかかってください。戻ったら、私に「復旧したことを報告しに来ました。」と言いに来てください。" 

  robot.respond /復旧したことを報告しに来ました。.*/i, (res) ->
    res.reply "ご苦労様です。復旧したことですし、とりあえずよしとしましょう。ただ、こちらが気づく前に、そちらで気づかないようでは困りますね。あらかじめそちらで気づくような仕組みを作っておいてください。"
    res.send "「@boss お客様から壊れたことを気づく仕組みを作ってほしいと頼まれました。」の形式です。"
