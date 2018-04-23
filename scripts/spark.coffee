# Description:
#   Tells you how many spark points you have
#
# Configuration:
#   None
#
# Commands:
#   hubot points - shows how many spark points you have
#
# Author:
# Yuriy Minin <me@yuriy.io>

module.exports = (robot) ->

  robot.respond /points/i, (msg) ->
    username = msg.message.user.name
    msg.http("http://tally.ieeeut.org/api/users/" + username)
      .get() (err, res, body) ->
        user = JSON.parse(body).user
        points = user.meetingPoints
        msg.send "You currently have " + points + " spark points."
