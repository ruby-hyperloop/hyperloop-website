class StartPage < Hyperloop::Router::Component

  render(DIV) do

    sidebar = StartSidebar(section_store: SiteStore.sections[:start]).as_node
    body = StartBody(section_store: SiteStore.sections[:start]).as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: SiteStore.sections[:start].loaded?)
  end
end
