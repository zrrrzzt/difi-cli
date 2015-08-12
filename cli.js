#!/usr/bin/env node
'use strict'

var difi = require('difi')
var pkg = require('./package.json')
var getHelpText = require('./lib/getHelpText')
var query = process.argv[2]
var argv = require('minimist')((process.argv.slice(2)))
var opts = {
  dataset: argv.dataset,
  format: argv.format || 'yaml',
  query: {
    query: argv.query
  }
}

if (!query || process.argv.indexOf('-h') !== -1 || process.argv.indexOf('--help') !== -1) {
  console.log(getHelpText())
  process.exit(0)
}

if (process.argv.indexOf('-v') !== -1 || process.argv.indexOf('--version') !== -1) {
  console.log(pkg.version)
  process.exit(0)
}

if (query.indexOf('--') === -1) {
  opts.dataset = argv._[0]
}

difi(opts, function (error, data) {
  if (error) {
    console.error(error)
  } else {
    console.log(data)
  }
})
