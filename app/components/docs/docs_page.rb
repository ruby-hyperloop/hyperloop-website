class DocsPage < Hyperloop::Router::Component

    
  before_mount do
    SidebarStore.hide
  end

  render(DIV) do
    #puts match.url

    section = "docs"
    displaytitle = "Hyperloop Documentation"

    sidebar = PageToc(history: history, location: location, section: section).as_node
    body = PageBody(section: section).as_node
    

    # Route('/docs/:repo', exact: true) do
    #   puts "we have a repo"
    # end

    # Route('/docs/:repo/:file', exact: true) do
    #   puts "we have a repo and file"
    # end

    # Route("#{match.url}", exact: false) do |m, l, h|
    #   puts "we have only a section name #{match.url}"
    #   PageLayout(section: match.url, match: m, location: l, history: h) 
    # end

    # Route("#{match.url}/:page_name", exact: false) do |m, l, h|
    #   puts "we have a section name #{match.url} and a page name"
    #   PageLayout(section: match.url, match: m, location: l, history: h) 
    # end

    PageLayout(sidebar_component: sidebar, 
              body_component: body, 
              page_title: displaytitle, 
              section: section, 
              loaded: SiteStore.sections[section].loaded?,
              history: history,
              location: location)

  end

end
