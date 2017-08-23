class Page < Hyperloop::Component

  after_mount do
    puts "about to get"
    # HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
    #   @raw = response.body
    #   mutate.html `Markdown.toHTML("hello")`
    # end
  end

  render(DIV) do
    BUTTON { "do it" }.on(:click) do
      HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
        @raw = response.body
        mutate.html `Marked(#{@raw})`
      end
    end
    DIV(dangerously_set_inner_HTML: { __html: state.html})
  end
end
