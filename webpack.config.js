var webpack = require('webpack');
var path = require('path');
const WebpackShellPlugin = require('webpack-shell-plugin');
var HtmlWebpackPlugin =  require('html-webpack-plugin');

var BUILD_DIR = path.resolve(__dirname, 'dist');

var config = {
  entry: './client.js',
  output: {
    path: BUILD_DIR,
    filename: 'bundle.js'
  },
  module: {

    loaders: [
          { test: /\.css$/,
            loader: "style-loader!css-loader"
          }
    ]

  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new WebpackShellPlugin({onBuildStart:['bundle exec rake build'], dev: false})
  ]

};

module.exports = config;
