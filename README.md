[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)

# difi-cli

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

## Docker
To run this module as a service use the docker image.

Build
```sh
$ docker build -t difi-cli .
```

Run a container with arguments described in **Usage**. Use environment variables to specify input.

```sh
$ docker run --rm -e DATASET=<dataset> -e QUERY=<query> -e FORMAT=<format> difi-cli
```

This will spin up a container. Do the job. Shut it down and remove it.

## Related

- [difi](https://github.com/zrrrzzt/difi) The API for this module

## License

[MIT](LICENSE)
