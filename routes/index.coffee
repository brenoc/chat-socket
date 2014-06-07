# Module dependencies
express = require('express')
controllers = require('../controllers')

###
 the new Router exposed in express 4
 the indexRouter handles all requests to the `/` path
###
indexRouter = express.Router()

# this accepts all request methods to the `/` path
indexRouter.route('/')
  .all(controllers.index)

exports.indexRouter = indexRouter
