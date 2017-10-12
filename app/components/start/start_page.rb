class StartPage < Hyperloop::Router::Component

   before_mount do
    SidebarStore.hide
  end

  render(DIV) do

    section_name = "start"
    displaytitle = "Get started"

    sidebar = PageToc(history: history, location: location, section: section_name).as_node
    body = PageBody(section: section_name).as_node
    
    PageLayout(sidebar_component: sidebar, 
              body_component: body, 
              page_title: displaytitle, 
              section: section_name, 
              loaded: SiteStore.sections[section_name].loaded?,
              history: history,
              location: location)

  end

end
