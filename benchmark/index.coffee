benchmarked = require 'benchmarked'
format = require 'comma-number'
pad = require 'pad'
chalk = require 'chalk'
bold  = chalk.bold
dim   = chalk.dim
grey  = chalk.grey

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
      format  : (bm) ->
        name = bold pad 15, bm.name
        ops  = pad 10, format bm.hz.toFixed(if bm.hz < 100 then 2 else 0)
        rme  = '\xb1' + bm.stats.rme.toFixed(2)[0...4] + '%'
        size = pad 2, bm.stats.sample.length
        ess  = if bm.stats.sample.length is 1 then ' ' else 's'
        runs = grey 'run' + ess + ' sampled)'

        "#{name} #{dim 'x'} #{ops} #{grey 'ops/sec'} #{rme} #{grey '('}#{size} #{runs}"

      # convert this implementation's file name to its real name.
      renameKey: (file) -> if file.stem is 'this_library' then '@flatten/array' else file.stem
    }).run()

  else console.log 'quitting'
