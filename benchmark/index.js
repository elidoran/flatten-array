
const benchmark = require('benchmarked')
const format    = require('comma-number')
const pad       = require('pad')
const chalk     = require('chalk')

const bold  = chalk.bold
const dim   = chalk.dim
const grey  = chalk.grey

const ask = require('readline').createInterface({
  input : process.stdin,
  output: process.stdout
})

console.log('@flatten/array benchmark (' + process.pid + ' ' +
  (process.execArgv.indexOf('--turbo') > -1 ? '- turbo' : '') + ')')

ask.question('Begin benchmark? (y/N)  ', function(answer) {

  ask.close()

  if ((answer != null) && (answer[0] === 'y' || answer[0] === 'Y')) {

    benchmark({
      cwd     : __dirname,
      fixtures: 'inputs/*.js',
      code    : 'implementations/*.js',

      format  : function(bm) {

        const name = bold(pad(18, bm.name))
        const ops  = pad(10, format(bm.hz.toFixed(bm.hz < 100 ? 2 : 0)))
        const rme  = '\xb1' + bm.stats.rme.toFixed(2).slice(0, 4) + '%'
        const size = pad(2, bm.stats.sample.length)
        const ess  = bm.stats.sample.length === 1 ? ' ' : 's'
        const runs = grey('run' + ess + ' sampled)')

        return name + ' ' + (dim('x')) + ' ' + ops + ' ' + (grey('ops/sec')) +
          ' ' + rme + ' ' + (grey('(')) + size + ' ' + runs
      },

      renameKey: function(file) {
        return (file.stem === '_this_library') ? '@flatten/array' : file.stem
      }
    }).run()

  }

  else {
    console.log('quitting')
  }

})
