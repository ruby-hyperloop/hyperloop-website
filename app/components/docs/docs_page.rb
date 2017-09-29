class DocsPage < Hyperloop::Router::Component

  
  before_mount do
    SidebarStore.hide
  end

  render(DIV) do
    puts match.url

    section_name = "docs"
    displaytitle = "Hyperloop Documentation"

    sidebar = PageToc(history: params.history, location: params.location, section: section_name).as_node
    body = PageBody(section: section_name).as_node
    

    Route('/docs/:repo', exact: true) do
      puts "we have a repo"
    end

    Route('/docs/:repo/:file', exact: true) do
      puts "we have a repo and file"
    end

    Route('/docs/:repo/:file/:slug', exact: true) do
      puts "we have a repo and file and slug"
    end

    PageLayout(sidebar_component: sidebar, body_component: body, page_title: displaytitle, section: section_name, loaded: SiteStore.sections[section_name].loaded?)

  end

end
