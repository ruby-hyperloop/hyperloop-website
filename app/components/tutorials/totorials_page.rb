class TutorialsPage < Hyperloop::Router::Component
  render(DIV) do

    sidebar = TutorialsSidebar().as_node
    body = TutorialsBody().as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
