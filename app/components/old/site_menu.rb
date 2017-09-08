# class SiteMenu < Hyperloop::Component
#
#   state active_item: :home
#
#   render(DIV) do
#     Sem.Menu(icon: :labeled) {
#       Sem.MenuItem(name: :home, active: (state.active_item == :home), onClick: -> { mutate.active_item :home } ) {
#         Sem.Icon(name: 'smile')
#         "Home"
#       }
#       Sem.MenuItem(name: :learn, active: (state.active_item == :learn), onClick: -> { mutate.active_item :learn } ) {
#         Sem.Icon(name: 'star' )
#         "Learn"
#       }
#       Sem.MenuItem(name: :docs, active: (state.active_item == :docs), onClick: -> { mutate.active_item :docs }) {
#         Sem.Icon(name: 'food' )
#         "Docs"
#       }
#       Sem.MenuItem(name: :gems, active: (state.active_item == :gems), onClick: -> { mutate.active_item :gems }) {
#         Sem.Icon(name: 'car' )
#         "Gems"
#       }
#     }
#   end
# end
