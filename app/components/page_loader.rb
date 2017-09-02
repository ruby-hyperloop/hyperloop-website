class PageLoader < Hyperloop::Component

  after_mount do
  end

  render(DIV) do
    if PageStore.loaded?
      # Sem.Grid do
      #   Sem.GridRow(columns: 2) do
      #     Sem.GridColumn(width: 4) do
            side_nav
          # end
          # Sem.GridColumn(width: 12) do
            body
          # end
        # end
      # end
    else
      Sem.Dimmer(active:true, inverted:true) {
        Sem.Loader(inverted:true, size: :large, content: 'Loading pages')
      }
    end

  end

  def side_nav
    # Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      # Sticky {
        # PageStore.pages.each do |page|
        Sem.Menu(fixed: :left, vertical:true, size: :huge, inverted: false, compact: true ) {
          PagesToc(pages: PageStore.pages)
        }
        # end
      #}
    # }
  end

  def body
    #Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      DIV(class: 'main-container') do
        H1 { "here now alfie wants to go swimming now" }
        PageStore.pages.each do |page|
          PageBody(page: page) if page[:md_converter]
          Sem.Divider()
        end
      end
    #}
  end

end
