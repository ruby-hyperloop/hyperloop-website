class DocsSidebar < Hyperloop::Component
  param :section_store

  render(DIV) do
    Sem.Segment(basic: true) {
      Sem.Header(as: 'h3') { "COMPS Documentation" }
    }
    PageToc(section_store: params.section_store)
  end

end
