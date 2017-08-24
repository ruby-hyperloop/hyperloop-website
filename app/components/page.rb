
class Page < Hyperloop::Component

  render(DIV) do
    BUTTON { "Get" }.on(:click) do
      get
    end

    HighlightX(innerHTML: true) {
      state.html
    }
  end

  def get
    HTTP.get('/DOCS.md') do |response|
      md = MdConverter.new(response.body)
      mutate.html md.html
    end
  end

end
