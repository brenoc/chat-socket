###
 do something with the user model
 var User = require('../models/user');
###

exports.index = (req, res) ->
  res.render 'index', {
    title: 'Chat room'
  }
