class DocsSidebar < Hyperloop::Component
  param :section_store
  param :history
  param :section

  render do
    # Sem.Segment(basic: true) {
    #   Sem.Header(as: 'h3') { "COMPS Documentation" }
    # }
    PageToc(section_store: params.section_store, history: params.history, section: params.section)





  end

end
