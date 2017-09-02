require_tree './components'
require_tree './stores'

# following only required for development (find a way to build without for production)
require 'opal_hot_reloader' 
OpalHotReloader.listen
require 'opal'

Document.ready? do
  Element['#site'].render{ Components::Home() }
end
