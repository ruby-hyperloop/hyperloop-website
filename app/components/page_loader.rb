class PageLoader < Hyperloop::Component

  after_mount do
  end

  render(DIV) do
    BUTTON { "Force Update" }.on(:click) { force_update! }
    Sem.Divider()

    if PageStore.loaded?
      Sem.Grid do
        Sem.GridRow(columns: 2) do
          Sem.GridColumn(width: 4) do
            side_nav
          end
          Sem.GridColumn(width: 12) do
            body
          end
        end
      end
    else
      H1 { "loading....." }
    end

  end

  def side_nav
    # Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      Sticky {
        PageStore.pages.each do |page|
          PageToc(page: page)
        end
      }
    # }
  end

  def body
    Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      PageStore.pages.each do |page|
        PageBody(page: page) if page[:md_converter]
        Sem.Divider()
      end
    }
  end

end
