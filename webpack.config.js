var webpack = require('webpack');
var path = require('path');

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
    new webpack.HotModuleReplacementPlugin()
  ]

};

module.exports = config;
