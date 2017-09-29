
class AppRouter < Hyperloop::Router
  history :browser

  before_mount do
    `url = new URL(window.location.href)`
    redirect = `url.searchParams.get('redirect')`
    if redirect
      pathname = `url.searchParams.get('pathname')`
      hash = `url.searchParams.get('hash')`
      history.push "#{pathname}##{hash}"
    end
  end

  route do
    DIV {
      Switch do
        Route('/', exact: true, mounts: HomePage)
        Route('/start', exact: false, mounts: StartPage)
        Route('/installation', exact: true, mounts: InstallationPage)
        Route('/tutorials', exact: true, mounts: TutorialsPage)
        Route('/gems', exact: true, mounts: GemsPage)
        Route('/tools', exact: true, mounts: ToolsPage)
        Route('/docs', exact: false) { |m, l, h| DocsPage(match: m, location: l, history: h) }
        
      end
    }
  end
end
