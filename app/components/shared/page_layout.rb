class PageLayout < Hyperloop::Router::Component
  param :sidebar_component
  param :body_component
  param :loaded

  render(DIV) do

    Sem.Dimmer(active: (params.loaded ? false : true), inverted: true) {
      Sem.Loader(inverted: true, size: :large, content: 'Loading dynamic content...')
    }

    # FRED cannot get this column to scroll independantly!!
    # I can make it work if I take the menu away but not ther - very fiddly
    #  please solve this - I give up on this one
    Sem.Grid do
      Sem.GridRow { AppMenu() }
      Sem.GridRow(columns: '3') do
        Sem.GridColumn do
          Sem.SidebarPushable do
            Sem.Sidebar(as: :Segment, animation: :push, width: :wide, visible: SidebarStore.visible ) do
              # DIV(class: 'sidenav-container') {
              # FRED I am not sure why the style from the div is not being applied, so am using
              # Sem.Container as a hack...
              Sem.Container(style: { marginTop: '3.5em' }) {
                params.sidebar_component.render
              }
            end
          end
        end
        Sem.GridColumn do
          Sem.SidebarPusher do
            Sem.Container(text: true, style: { marginTop: '3.5em'}) {
              params.body_component.render
            }
          end
        end
      end
    end

  end

end
