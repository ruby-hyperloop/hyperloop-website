class DocsPage < Hyperloop::Router::Component

  before_mount do
    SidebarStore.hide
  end

  render(DIV) do
    puts match.url

    sidebar = DocsSidebar(section_store: SiteStore.sections[:docs],
                          history: history,
                          section: 'docs').as_node
    body = DocsBody(section_store: SiteStore.sections[:docs]).as_node
    title = "Hyperloop Documentation"

    Route('/docs/:repo', exact: true) do
      puts "we have a repo"
    end

    Route('/docs/:repo/:file', exact: true) do
      puts "we have a repo and file"
    end

    Route('/docs/:repo/:file/:slug', exact: true) do
      puts "we have a repo and file and slug"
    end

    PageLayout(sidebar_component: sidebar, body_component: body, page_title: title, loaded: SiteStore.sections[:docs].loaded?)

  end

end
