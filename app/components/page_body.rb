class PageBody < Hyperloop::Component
  param :page

  render(DIV) do
    H1 {  params.page[:repo].to_s }
  end
end
