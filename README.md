[![Build Status](https://travis-ci.org/zrrrzzt/difi-cli.svg?branch=master)](https://travis-ci.org/zrrrzzt/difi-cli)
[![Coverage Status](https://coveralls.io/repos/zrrrzzt/difi-cli/badge.svg?branch=master&service=github)](https://coveralls.io/github/zrrrzzt/difi-cli?branch=master)
[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)
# difi

CLI for querying the [hotell.difi.no API](http://hotell.difi.no/api).

## Installation

```sh
$ npm install difi-cli -g
```

## Usage

```sh
$ difi <dataset> --query=<query>
```
Optionally set return format.
Can be csv, json, jsonp, xml or yaml (default)

```sh
$ difi <dataset> --query=<query> --format=<format>
```

To display help

```sh
$ difi --help
```

To display version

```sh
$ difi --version
```

## Related

- [difi](https://github.com/zrrrzzt/difi) The API for this module