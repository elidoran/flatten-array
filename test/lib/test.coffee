assert = require 'assert'

flatten = require '../../lib/index.js'

describe 'test flatten', ->

  it 'on empty array', -> assert.deepEqual flatten([]), []

  it 'on flat array', ->

    input  = [ 1, '2', {three:'3'}, new Date(2017, 3, 1) ]
    answer = [ 1, '2', {three:'3'}, new Date(2017, 3, 1) ]
    assert.deepEqual flatten(input), answer

  it 'with level=1 sub arrays', ->

    input  = [ 1, [ 2, 3 ], 4, [ 5, 6, 7 ], 8 ]
    answer = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    assert.deepEqual flatten(input), answer

  it 'with level=1+2 sub arrays', ->

    input  = [ 1, [ 2, 3 ], 4, [ 5, [ 6 ], 7 ], 8 ]
    answer = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    assert.deepEqual flatten(input), answer

  it 'with level=1+2+3 sub arrays', ->

    input  = [ 1, [ 2 ], 3, [ 4, [ 5, [ 6 ] ], 7 ], 8 ]
    answer = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    assert.deepEqual flatten(input), answer
