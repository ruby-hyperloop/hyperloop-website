
class DocsBody < Hyperloop::Component
  param :page_store

  render do
    PageBody(page_store: params.page_store)
  end

end
