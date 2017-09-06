class DocsSidebar < Hyperloop::Component
  param :page_store

  render(DIV) do
    H1 { "Docs sidebar" }
  end
end
