class StartSidebar < Hyperloop::Component
  param :section_store

  render(DIV) do
    Sem.Segment(basic: true) {
      Sem.Header(as: 'h3') { "Start learning Hyperloop" }
    }
    PageToc(section_store: params.section_store)
  end
end
