assert = require 'assert'

optimize = require '@optimal/fn'

flatten = require '../../lib/index.js'

describe 'verify optimizability', ->

  it 'with empty array', ->

    result = optimize flatten, null, [ [] ]
    assert.equal result.optimized, true
