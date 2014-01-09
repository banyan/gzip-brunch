# gzip-brunch [![Build Status](https://secure.travis-ci.org/banyan/gzip-brunch.png?branch=master)](http://travis-ci.org/banyan/gzip-brunch)

Adds gzip support to [brunch](http://brunch.io).

The plugin will gzipfy HTML files, JS files and CSS files.

## Usage

Install the plugin via npm with:

```
$ npm install --save gzip-brunch
```

This plugin works only when optimized option is passed.

```
$ brunch build --production
```

## Config

To specify gzip options, use `config.plugins.gzip` object.

### Change JS path or CSS path

```coffeescript
config =
  plugins:
    gzip:
      paths:
        javascript: 'javascripts'
        stylesheet: 'stylesheets'
```

* default

<table>
  <tr>
    <th>gzip.paths.javascript</th>
    <td>javascripts</td>
  </tr>
  <tr>
    <th>gzip.paths.stylesheet</th>
    <td>stylesheets</td>
  </tr>
</table>

## CHANGELOG

### gzip-brunch 1.0.1 (10 Jan 2014)

* Update docs

### gzip-brunch 1.0.0 (29 Sep 2013)

* Initial release

## License

The MIT License (MIT)

Copyright (c) 2013 Kohei Hasegawa
