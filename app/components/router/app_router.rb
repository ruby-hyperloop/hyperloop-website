class AppRouter < Hyperloop::Router
  history :browser

  route do
    DIV {
      Switch do
        Route('/', exact: true, mounts: HomePage)
        Route('/docs', exact: true, mounts: DocsPage)
      end
    }
  end
end
