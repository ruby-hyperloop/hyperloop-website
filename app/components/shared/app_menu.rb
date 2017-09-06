class AppMenu < Hyperloop::Router::Component

  render(DIV) do
    Sem.Menu(fixed: :top, inverted: false) do
      sidebar_toggle
      home
      docs
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

  def docs
    Sem.MenuItem {
      Link('/docs') { 'DOCS' }
    }
  end

end
