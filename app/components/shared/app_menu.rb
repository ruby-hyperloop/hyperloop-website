class AppMenu < Hyperloop::Router::Component

  render(DIV) do
    Sem.Menu(fixed: :top, inverted: false) do
      sidebar_toggle
      home
      start
      installation
      tutorials
      gems
      tools
      docs
      search
    end
  end

  def sidebar_toggle
    A(class: 'item', id: 'togglemenu') do
      Sem.Icon(name: 'sidebar')
    end.on(:click) {
      SidebarStore.toggle
    }
  end

  def home
    Sem.MenuItem {
      Link('/') { 'HOME' }
    }
  end

  def start
    Sem.MenuItem {
      Link('/start') { 'START' }
    }
  end

  def installation
    Sem.MenuItem {
      Link('/installation') { 'INSTALLATION' }
    }
  end

  def tutorials
    Sem.MenuItem {
      Link('/tutorials') { 'TUTORIALS' }
    }
  end

  def gems
    Sem.MenuItem {
      Link('/gems') { 'GEMS' }
    }
  end

  def tools
    Sem.MenuItem {
      Link('/tools') { 'TOOLS' }
    }
  end

  def docs
    Sem.MenuItem {
      Link('/docs') { 'DOCS' }
    }
  end

  def search
    Sem.MenuMenu(position: :right) {
      Sem.MenuItem {
        SiteSearch()
      }
    }
  end

end
