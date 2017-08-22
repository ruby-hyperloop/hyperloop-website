module Components
  class Home < Hyperloop::Component
    render do
      Sem.Container do
        H1 { "Hello I am the new Hyperloop website" }
        Sem.Button(primary: true) { "Press me" }.on(:click) { alert "V3 baby" }
      end
    end
  end
end
