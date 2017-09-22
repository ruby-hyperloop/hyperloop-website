class ToolsPage < Hyperloop::Router::Component
  render(DIV) do

    DIV(class: 'testdiv') do
    DIV(class: 'fixedmenu') do

      A(href: '') {'link 1'}
      A(href: '') {'link 1'}
      A(href: '') {'link 1'}
      A(href: '') {'link 1'}
    end
  end
    # sidebar = ToolsSidebar().as_node
    # body = ToolsBody().as_node

    # PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)
  end
end
