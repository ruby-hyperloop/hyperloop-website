class GemsPage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = GemsSidebar().as_node
    body = GemsBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
