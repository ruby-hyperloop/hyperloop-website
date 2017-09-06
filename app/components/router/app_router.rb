class AppRouter < Hyperloop::Router
  history :browser

  route do
    DIV {
      # each route must render the page it wants completely
      # all pages should conform to having:
      # AppMenu, SideNav and a PageBody 
      Switch do
        Route('/', exact: true, mounts: HomeRoute)
        Route('/docs', exact: true, mounts: DocsRoute)
      end
    }
  end
end
