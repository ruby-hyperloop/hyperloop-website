
class DocsBody < Hyperloop::Component
  param :section_store

  render do
    PageBody(section_store: params.section_store)
  end

end
