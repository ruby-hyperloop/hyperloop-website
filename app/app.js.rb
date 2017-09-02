require_tree './components'
# require_tree './operations'
require_tree './stores'

require 'opal_hot_reloader' # this will move to hyperloop.js

OpalHotReloader.listen

require 'opal' # we dont need this for production (adds lot of size)

Document.ready? do
  puts "here"
  Element['#site'].render{ Components::Home() }
end
