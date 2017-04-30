assert = require 'assert'

flatten = require '../../lib/index.js'

describe 'test flatten', ->

  it 'on empty array', -> assert.deepEqual flatten([]), []

  it 'on flat array', ->

    input  = [ 1, '2', {three:'3'}, new Date(2017, 3, 1) ]
    answer = [ 1, '2', {three:'3'}, new Date(2017, 3, 1) ]
    assert.deepEqual flatten(input), answer

  it 'with empty inner arrays', ->

    input  = [ 1, '2', [], 3, [[]], 4, [ 5, [], 6] ]
    answer = [ 1, '2', 3, 4, 5, 6 ]
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

  it 'doesnt change inner arrays', ->

    a1 = [ 2 ]
    a4 = [ 6 ]
    a3 = [ 5, a4 ]
    a2 = [ 4, a3, 7 ]
    input = [ 1, a1, 3, a2, 8 ]
    answer = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    assert.deepEqual flatten(input), answer
    # ensure the inner arrays weren't altered
    assert.deepEqual a1, [ 2 ]
    assert.deepEqual a2, [ 4, [ 5, [ 6 ] ], 7 ]
    assert.deepEqual a3, [ 5, [ 6 ] ]
    assert.deepEqual a4, [ 6 ]
