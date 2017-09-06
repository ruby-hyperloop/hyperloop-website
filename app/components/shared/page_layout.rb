class PageLayout < Hyperloop::Router::Component
  param :sidebar_component
  param :body_component
  param :loaded

  render(DIV) do
    AppMenu()

    Sem.Dimmer(active: (params.loaded ? false : true), inverted: true) {
      Sem.Loader(inverted: true, size: :large, content: 'Loading dynamic content...')
    }

    Sem.SidebarPushable do
      Sem.Sidebar(animation: :push, width: :wide, visible: SidebarStore.visible ) do
        # DIV(class: 'sidenav-container') {
        # FRED I am not sure why the style from the div is not being applied, so am using
        # Sem.Container as a hack...
        Sem.Container(style: { marginTop: '3.5em' }) {
          params.sidebar_component.render
        }
      end
      Sem.SidebarPusher {
        Sem.Container(style: { marginTop: '3.5em'}) {
          params.body_component.render
        }
      }
    end
  end

end
