# see http://webpack.github.io/docs/configuration.html

webpack = require "webpack"
path = require 'path'
pkg = require './package.json'

outputFile = pkg.name + '.min.js'

resolveRoot = path.join __dirname, 'lib'
entryFile = pkg.name + '.js'

module.exports =
  output:
    path: 'dist'
    filename: outputFile
  cache: true
  debug: true
  devtool: false
  entry: entryFile
  stats:
    colors: true
    reasons: true

  resolve:
    root: [ resolveRoot ]
    extensions: [
      ""
      ".js"
      ".coffee"
    ]

  module:
    loaders: [
      # CoffeeScript support
      { test: /\.coffee$/, loader: 'coffee' }

      # other loaders
      #{ test: /bootstrap\/js\//, loader: 'imports?jQuery' }
      #{ test: /\.jade$/,   loader: 'rv!jade-html' }
      #{ test: /\.less$/,   loader: "style!css!less" }
      #{ test: /\.css$/,    loader: "style!css", exclude: /\.useable\.css$/ }
      #{ test: /\.useable\.css$/, loader: "style/useable!css" }
      { test: /\.json$/,   loader: "json" }

      # media
      #{ test: /\.png$/,    loader: "url?limit=10000&minetype=image/png" }
      #{ test: /\.jpg$/,    loader: "url?limit=10000&minetype=image/jpg" }
      #{ test: /\.gif$/,    loader: "url?limit=10000&minetype=image/gif" }
      #{ test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,   loader: "url?limit=10000&minetype=application/font-woff" }
      #{ test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,    loader: "url?limit=10000&minetype=application/octet-stream" }
      #{ test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,    loader: "file" }
      #{ test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,    loader: "url?limit=10000&minetype=image/svg+xml" }
    ]

  plugins: [
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.UglifyJsPlugin()
    new webpack.optimize.OccurenceOrderPlugin()
    new webpack.optimize.AggressiveMergingPlugin()
  ]

