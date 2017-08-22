require 'opal'
require 'opal_hot_reloader' # this will move to hyperloop.js

task :build do
   puts "Building dist/app.js...."
   Opal.append_path "app"
   File.open("dist/app.js", "w+") do |out|
     out << Opal::Builder.build("app").to_s
   end
   cp 'source/index.html', 'dist/index.html'
end

task :server do
  sh 'bundle exec rake build'
  sh 'foreman start'
end
