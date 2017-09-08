class StartPage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = StartSidebar().as_node
    body = StartBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
