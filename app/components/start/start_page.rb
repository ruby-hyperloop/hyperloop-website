class StartPage < Hyperloop::Router::Component

  before_mount do
    pages = [
      { repo: 'hyperloop-website',     file: 'pages/start/components.md',  allow_edit: true },
      { repo: 'hyperloop-website',     file: 'pages/start/stores.md',  allow_edit: true }
    ]

    @page_store ||= PageStore.new(pages)
  end

  render(DIV) do

    sidebar = StartSidebar(page_store: @page_store).as_node
    body = StartBody(page_store: @page_store).as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: @page_store.loaded?)
  end
end
