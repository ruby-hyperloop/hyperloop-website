class Page < Hyperloop::Component

  before_mount do
    puts "about to get yy"
    HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
      @raw = response.body
      mutate.html `Marked(#{@raw})`
    end
  end

  # state html: ""

  render(DIV) do
    # BUTTON { "do it" }.on(:click) do
    #   HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
    #     @raw = response.body
    #     mutate.html `Marked(#{@raw})`
    #     mutate.got_it true
    #   end
    # end
    # DIV(dangerously_set_inner_HTML: { __html: state.html })
    # puts state.html.to_s
    Highlight(innerHTML: true) { state.html }
  end
end
