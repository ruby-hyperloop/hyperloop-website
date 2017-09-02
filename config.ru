require 'opal-sprockets'

require 'bundler'
Bundler.require

run Opal::Server.new { |server|
  # the name of the ruby file to load. To use more files they must be required from here (see app)
  server.main = 'app'
  # the directory where the code is (add to opal load path )
  server.append_path 'app'
  server.index_path = './app/index.html.erb'
}
