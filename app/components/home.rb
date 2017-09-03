module Components
  class Home < Hyperloop::Component

    state repo: nil
    state code_mirror: false

    render(DIV) do
      # H1 { "DOCS PageLoader" }
      # Sem.Divider()
      # SiteMenu()
      PageLoader()
    end
  end
end
