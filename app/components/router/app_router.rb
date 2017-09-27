class AppRouter < Hyperloop::Router
  history :browser

  route do
    DIV {
      Switch do
        Route('/', exact: true, mounts: HomePage)
        Route('/start', exact: false, mounts: StartPage)
        Route('/installation', exact: true, mounts: InstallationPage)
        Route('/tutorials', exact: true, mounts: TutorialsPage)
        Route('/gems', exact: true, mounts: GemsPage)
        Route('/tools', exact: true, mounts: ToolsPage)
        Route('/docs', exact: false, mounts: DocsPage)
      end
    }
  end
end
