class DocsSidebar < Hyperloop::Component
  param :page_store

  render(DIV) do
    Sem.Segment(basic: true) {
      Sem.Header(as: 'h3') { "COMPS Documentation" }
    }
    PageToc(page_store: params.page_store)
  end

end
