class StartPage < Hyperloop::Router::Component

  before_mount do
    pages = [
      { repo: 'hyperloop-website',     file: 'pages/start/components.md',  allow_edit: true },
      { repo: 'hyperloop-website',     file: 'pages/start/stores.md',  allow_edit: true }
    ]

    @section_store ||= SectionStore.new(pages)
  end

  render(DIV) do

    sidebar = StartSidebar(section_store: @section_store).as_node
    body = StartBody(section_store: @section_store).as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: @section_store.loaded?)
  end
end
