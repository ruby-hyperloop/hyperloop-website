class StartPage < Hyperloop::Router::Component

  render(DIV) do

    sidebar = DocsSidebar(section_store: SiteStore.sections[:start],
                          history: history,
                          section: 'start').as_node
    body = StartBody(section_store: SiteStore.sections[:start]).as_node
    title = "Get started with Hyperloop"

    PageLayout(sidebar_component: sidebar, body_component: body, page_title: title, loaded: SiteStore.sections[:start].loaded?)
  end
end
