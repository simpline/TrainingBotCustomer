# Description:
#   The 1st week of Training - 自己紹介
#
# Commands:
#   customer {名前}と申します。{これまでの経歴}

module.exports = (robot) ->
  robot.respond /(.*)と申します。.*/i, (res) ->
    namae = res.match[1]
    res.reply "はじめまして、#{namae}さん。これからよろしくおねがいします。"
