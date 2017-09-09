class DocsPage < Hyperloop::Router::Component

  render(DIV) do

    sidebar = DocsSidebar(section_store: SiteStore.sections[:docs]).as_node
    body = DocsBody(section_store: SiteStore.sections[:docs]).as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: SiteStore.sections[:docs].loaded?)
  end
end
