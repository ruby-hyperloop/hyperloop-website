class DocsBody < Hyperloop::Component
  render(DIV) do
    100.times do
      H1 { "Docs body" }
    end
  end
end
