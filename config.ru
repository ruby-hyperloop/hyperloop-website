require 'opal-sprockets'
require "./rack-custom_404.rb"

require 'bundler'
Bundler.require

my_404_page_content = File.read("./404.html")
use Rack::Custom404, my_404_page_content

run Opal::Server.new { |server|

  server.main = 'app'
  server.append_path 'app'
  server.index_path = './app/index.html.erb'
}
