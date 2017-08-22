module Components
  class Home < Hyperloop::Component
    render(DIV) do
      H1 { "Hello I am the new Hyperloop websitef" }
      BUTTON { "Press me" }.on(:click) { alert "V3 baby" }
    end
  end
end
