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
      {
        path: @_joinToPublic @options.paths?.image or 'images'
        ext:  /\.svg$/
      }
      {
        path: @_joinToPublic @options.paths?.root or ''
        ext:  /\.ico$/
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
    input_path = "#{path}/#{file}"
    output_path = "#{path}/#{file}.gz"
    input  = fs.createReadStream input_path
    output = fs.createWriteStream output_path

    input.pipe(gzip).pipe output

    # Delete the original file generated
    if !!@options.removeOriginalFiles and fs.existsSync(input_path)
      fs.unlinkSync input_path

    # Rename gzip files to original files
    if !!@options.renameGzipFilesToOriginalFiles and fs.existsSync(input_path)
      fs.renameSync output_path, input_path

  _joinToPublic: (path) =>
    sysPath.join @config.paths.public, path
