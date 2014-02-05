fs      = require 'fs'
zlib    = require 'zlib'
sysPath = require 'path'

module.exports = class Gzip
  brunchPlugin: yes

  constructor: (@config) ->
    @options = @config?.plugins?.gzip ? {}
    @targets = [
      {
        path: @config.paths.public
        ext:  /\.html$/
      }
      {
        path: @_joinToPublic @options.paths?.javascript or 'javascripts'
        ext:  /\.js$/
      }
      {
        path: @_joinToPublic @options.paths?.stylesheet or 'stylesheets'
        ext:  /\.css$/
      }
    ]

  onCompile: (generatedFiles) ->
    return unless @config.optimize

    for target in @targets
      break unless fs.existsSync target.path

      fileList = fs.readdirSync target.path
      fileList.forEach (file) =>
        if file.match target.ext
          @_compress target.path, file

  _compress: (path, file) ->
    gzip   = zlib.createGzip level: zlib.Z_BEST_COMPRESSION
    input  = fs.createReadStream "#{path}/#{file}"
    output = fs.createWriteStream "#{path}/#{file}.gz"
    # Delete the original file generated
    fs.unlinkSync("" + path + "/" + file)
    input.pipe(gzip).pipe output

  _joinToPublic: (path) =>
    sysPath.join @config.paths.public, path
