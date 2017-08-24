require 'opal'
require 'opal_hot_reloader' # this will move to hyperloop.js

task :build do
  # puts "Webpacking..."
  # sh 'webpack -p' # production mode
  puts "Building app.js..."
  Opal.append_path "app"
  File.open("dist/app.js", "w+") do |out|
   out << Opal::Builder.build("app").to_s
  end
  # cp 'source/index.html', 'dist/index.html'
  puts "all done"
end

task :server do
  Rake::Task['build'].execute
  sh 'foreman start'
end
