benchmarked = require 'benchmarked'

ask = require('readline').createInterface
  input : process.stdin
  output: process.stdout

console.log "@flatten/array benchmark (#{process.pid} #{if '--turbo' in process.execArgv then '- turbo' else ''})"
ask.question 'Begin benchmark? (y/N)  ', (answer) ->

  ask.close()

  if answer? and (answer[0] is 'y' or answer[0] is 'Y')

    require('benchmarked')({
      cwd     : __dirname
      fixtures: 'inputs/*.js'
      code    : 'implementations/*.js'
    }).run()

  else console.log 'quitting'
