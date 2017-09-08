class ToolsPage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = ToolsSidebar().as_node
    body = ToolsBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
