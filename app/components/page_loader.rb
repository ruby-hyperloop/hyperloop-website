class PageLoader < Hyperloop::Component

  # state sidebar_visibility: true

  after_mount do
  end

  render(DIV) do

    # if PageStore.loaded?
    #
    #   # Sem.SidebarPushable(as: :span) do <--- this lets it scroll on its own
    #   Sem.SidebarPushable do
    #
    #     Sem.Sidebar(animation: :push, width: :wide, visible: SidebarStore.visible ) {
    #       # PagesToc(pages: PageStore.pages)
    #       side_nav
    #     }
    #
    #     Sem.SidebarPusher {
    #       DIV(class: 'maincontainer') do
    #         body
    #       end
    #     }
    #   end
    #
    # else
    #   Sem.Dimmer(active:true, inverted:true) {
    #     Sem.Loader(inverted:true, size: :large, content: 'Loading pages')
    #   }
    # end

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
