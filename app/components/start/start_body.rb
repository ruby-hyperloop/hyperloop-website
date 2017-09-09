class StartBody < Hyperloop::Component
  param :page_store
  
  render(DIV) do
    H1 { "Start body" }
  end
end
