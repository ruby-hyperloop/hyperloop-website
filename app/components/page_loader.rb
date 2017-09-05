class PageLoader < Hyperloop::Component

  state sidebar_visibility: true

  after_mount do
  end

  render(DIV) do

    if PageStore.loaded?

      Sem.Menu(icon: true, fixed: :top, inverted: false) {
        A(class: 'item', id: 'togglemenu') do
          Sem.Icon(name: 'sidebar')
          "Menu"
        end.on(:click) do
          mutate.sidebar_visibility !state.sidebar_visibility
        end
      }

      Sem.SidebarPushable(as: :Segment) do

        Sem.Sidebar(animation: :push, width: :wide, visible: (state.sidebar_visibility ? true : false)) {
          # PagesToc(pages: PageStore.pages)
          side_nav
        }

        Sem.SidebarPusher {
          DIV(class: 'maincontainer') do
            body
          end
        }
      end

    else
      Sem.Dimmer(active:true, inverted:true) {
        Sem.Loader(inverted:true, size: :large, content: 'Loading pages')
      }
    end

  end

  def side_nav

    # Sem.Menu(fixed: :left, vertical:true, size: :huge, inverted: false, compact: true ) {
    #   Sem.Grid {
    #     Sem.GridRow { SiteMenu()  }
    #     Sem.GridRow { PagesToc(pages: PageStore.pages) }
    #   }
    # }

    Sem.Menu(fixed: :left, vertical: true, size: :huge, inverted: false, compact: true, fluid: true ) {
          PagesToc(pages: PageStore.pages)
        }

  end

  def body
    DIV(class: 'docscontainer') do
      # PageStore.pages.each do |page|
      #   PageBody(page: page) if page[:md_converter]
      #   Sem.Divider()
      # end

      PageBody(page: PageStore.current_page)

    end
  end

end
