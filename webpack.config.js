var HtmlWebpackPlugin = require('html-webpack-plugin');

var HTMLWebpackPluginConfig = new HtmlWebpackPlugin ({
  template: __dirname + '/src/index.html',
  filename: 'index.html',
  inject: 'body'
});

module.exports = {
  entry: [
    './src/index.js'
  ],
  devtool: "source-map", // or "inline-source-map"
  module: {
    loaders: [
        {
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            loader: 'elm-webpack'
        },
        {
            test: /\.scss$/,
            loaders: ["style", "css?sourceMap", "sass?sourceMap"],
        },
    ]
  },
  output: {
   filename: "bundle.js",
   path: __dirname + '/dist',
 },
 plugins: [HTMLWebpackPluginConfig]
};
