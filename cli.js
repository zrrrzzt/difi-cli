#!/usr/bin/env node
(async () => {
  const difi = require('difi')
  const pkg = require('./package.json')
  const getHelpText = require('./lib/getHelpText')
  const query = process.argv[2]
  const argv = require('minimist')((process.argv.slice(2)))
  const opts = {
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

  try {
    const data = await difi(opts)
    console.log(opts.format === 'json' ? JSON.stringify(data, null, 2) : data)
  } catch (error) {
    console.error(error)
    process.exit(1)
  }
})()
