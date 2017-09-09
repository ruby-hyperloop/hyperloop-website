class StartBody < Hyperloop::Component
  param :section_store

  render(DIV) do
    PageBody(section_store: params.section_store)
  end
end
