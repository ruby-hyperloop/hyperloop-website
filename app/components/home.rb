module Components
  class Home < Hyperloop::Component

    render(DIV) do
      BUTTON { "Local: HyperModel DOCS" }.on(:click) do
        mutate.url '/DOCS.md'
        @key = 1
      end

      BUTTON { "Github: HyperComponent DOCS" }.on(:click) do
        mutate.url 'https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md'
        @key = 2
      end

      Sem.Divider()
      Page(url: state.url, key: @key, allow_edit: true) unless state.url.nil?

    end
  end
end
