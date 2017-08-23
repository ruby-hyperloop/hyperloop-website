class HighlightX < Hyperloop::Component
  imports 'Highlight'
end

class Page < Hyperloop::Component

  before_mount do
    HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
      @raw = response.body
      mutate.html `Marked(#{@raw})`
    end
  end

  render(DIV) do
    HighlightX(innerHTML: true) {
      state.html
    }
  end
end
