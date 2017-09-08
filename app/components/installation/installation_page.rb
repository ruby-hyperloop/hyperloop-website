class InstallationPage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = InstallationSidebar().as_node
    body = InstallationBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
