class HighlightX < Hyperloop::Component
  imports 'Highlight'
end

class Page < Hyperloop::Component

  # after_mount do
  #
  #   `Marked.setOptions({
  #   renderer: new Marked.Renderer(),
  #   gfm: true,
  #   tables: true,
  #   breaks: false,
  #   pedantic: false,
  #   sanitize: false,
  #   smartLists: true,
  #   smartypants: true
  #   });`
  #
  #   HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
  #     @raw = response.body
  #     mutate.html `Marked(#{@raw})`
  #   end
  # end

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
      @raw = response.body

      `var renderer = new Marked.Renderer()`
      `renderer.heading = #{lambda {|text, level| on_heading(text, level)} }`

      `Marked.setOptions({
        renderer: renderer
      });`

      mutate.html `Marked(#{@raw})`

    end
  end

  def on_heading text, level
    slug = text.downcase.gsub(/[^\w]+/g, '-')
    puts "#{slug} #{text} #{level}"
    "<h#{level} class='fred_heading_#{level}'>#{text}</h#{level}>"
  end

end
