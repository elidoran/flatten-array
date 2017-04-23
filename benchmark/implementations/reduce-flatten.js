reducer = require('reduce-flatten')
module.exports = function (array) {
  return array.reduce(reducer, [])
}
