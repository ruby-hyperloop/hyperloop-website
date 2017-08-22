require_tree './components'
require_tree './operations'
require_tree './stores'

require 'opal_hot_reloader' # this will move to hyperloop.js
OpalHotReloader.listen

Document.ready? do
  Element['#site'].render{ Components::Home() }
end
