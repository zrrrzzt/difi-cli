'use strict'

var exec = require('child_process').execFile
var tap = require('tap')
var getHelpText = require('../../lib/getHelpText')
var pkgVersion = require('../../package.json').version

tap.test('It returns helptext with -h flag', function helpTextWithH (test) {
  exec('./cli.js', ['-h'], function helpTextWithH (error, stdout, stderr) {
    if (error) {
      console.error(stderr.toString())
      throw error
    } else {
      test.equal(stdout.toString().trim(), getHelpText().toString().trim())
      test.end()
    }
  })
})

tap.test('It returns helptext with --help flag', function helpTextWithH (test) {
  exec('./cli.js', ['--help'], function helpTextWithH (error, stdout, stderr) {
    if (error) {
      console.error(stderr.toString())
      throw error
    } else {
      test.equal(stdout.toString().trim(), getHelpText().toString().trim())
      test.end()
    }
  })
})

tap.test('It returns version with -v flag', function versionWithV (test) {
  exec('./cli.js', ['-v'], function versionWithV (error, stdout, stderr) {
    if (error) {
      console.error(stderr.toString())
      throw error
    } else {
      test.equal(stdout.toString().trim(), pkgVersion)
      test.end()
    }
  })
})

tap.test('It returns error on error', function testError (test) {
  exec('./cli.js', ['npmlovesyou', '--query', 'do you love npm'], function versionWithV (error, stdout, stderr) {
    test.ok(error, 'Error OK')
    test.end()
  })
})

tap.test('It returns data', function testError (test) {
  exec('./cli.js', ['brreg/enhetsregisteret', '--query', 'Pythonia'], function versionWithV (error, stdout, stderr) {
    if (error) {
      throw error
    }
    test.ok(stdout.toString().trim(), 'Data OK')
    test.end()
  })
})
