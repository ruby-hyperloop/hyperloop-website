class DocsRoute < Hyperloop::Router::Component
  render(DIV) do

    sidebar = DocsSidebar().as_node
    body = DocsBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
