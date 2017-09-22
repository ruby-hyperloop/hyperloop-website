class DocsPage < Hyperloop::Router::Component

  before_mount do
    SidebarStore.hide
  end
  
  render do


    sidebar = DocsSidebar(section_store: SiteStore.sections[:docs]).as_node
    body = DocsBody(section_store: SiteStore.sections[:docs]).as_node
    title = "Hyperloop Documentation"

    PageLayout(sidebar_component: sidebar, body_component: body, page_title: title, loaded: SiteStore.sections[:docs].loaded?)

  end

end
