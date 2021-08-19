const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    ApplicationController: ['application_controller', 'default'],
  })
)

module.exports = environment
