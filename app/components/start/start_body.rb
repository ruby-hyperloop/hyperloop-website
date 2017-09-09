class StartBody < Hyperloop::Component
  param :section_store

  render(DIV) do
    H1 { "Start body" }
  end
end
