assert = require 'assert'

optimize = require '@optimal/fn'

flatten = require '../../lib/index.js'

describe 'verify optimizability', ->

  it 'with empty array', ->

    result = optimize flatten, null, [ [] ]
    assert.equal result.optimized, true

  it 'with flat array', ->

    result = optimize flatten, null, [ ['a', 'b', 'c'] ]
    assert.equal result.optimized, true

  it 'with non-flat array', ->

    result = optimize flatten, null, [ ['a', ['b', 'c'], 'd'] ]
    assert.equal result.optimized, true
