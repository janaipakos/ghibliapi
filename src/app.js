const jsonServer = require('json-server')
const clone = require('clone')
const data = require('../data.json')
const url = require('url');

const app = jsonServer.create()
const router = jsonServer.router(clone(data))

app.use((req, res, next) => {
  if (req.path === '/') return next()
  router.db.setState(clone(data))
  next()
})

app.use(jsonServer.defaults({
  logger: process.env.NODE_ENV !== 'production'
}))

app.use(router)

filterFields = (obj, fields) => {
  Object.keys(obj).forEach((prop) => {
    if (!fields.includes(prop)) {
      delete obj[prop]
    }
  })
  return obj
}

router.render = (req, res) => {
  const defaultLimit = 50
  const maxLimit = 250
  var data = res.locals.data
  var query = url.parse(req.originalUrl, true).query
  if (query.fields) {
    var fields = query.fields.split(',')
    if (data.constructor === Array) {
      data = data.map((obj) => filterFields(obj, fields))
    }
    if (data.constructor === Object) {
      data = filterFields(data, fields)
    }
  }
  if (query.limit) {
    if (data.constructor === Array) {
      data.length = Math.min(Math.min(query.limit, data.length), maxLimit)
    }
  }
  res.jsonp(data)
}


module.exports = app
