class HomePage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = HomeSidebar().as_node
    body = HomeBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
