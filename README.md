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
      removeOriginalFiles: false
      renameGzipFilesToOriginalFiles: false
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
  <tr>
    <th>gzip.removeOriginalFiles</th>
    <td>false</td>
  </tr>
  <tr>
    <th>gzip.renameGzipFilesToOriginalFiles</th>
    <td>false</td>
  </tr>
</table>

## CHANGELOG

* 1.3.0 (03 May 2014) - Enhancement for renaming option [#6](https://github.com/banyan/gzip-brunch/pull/6).
* 1.2.0 (20 Feb 2014) - Changed [#3](https://github.com/banyan/gzip-brunch/pull/3) behaviour as optionize. See [#5](https://github.com/banyan/gzip-brunch/pull/5)
* 1.1.0 (06 Feb 2014) - Original files are deleted when compressing is done: [#3](https://github.com/banyan/gzip-brunch/pull/3)
* 1.0.4 (28 Jan 2014) - Bumped for [#2](https://github.com/banyan/gzip-brunch/issues/2)
* 1.0.1 (10 Jan 2014) - Update docs
* 1.0.0 (29 Sep 2013) - Initial release

## License

The MIT License (MIT)

Copyright (c) 2013 Kohei Hasegawa
