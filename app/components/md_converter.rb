# https://www.npmjs.com/package/marked#block-level-renderer-methods

class MdConverter
  def initialize md
    @md = md
    process
  end

  def process
    `var renderer = new Marked.Renderer()`
    `renderer.heading = #{lambda {|text, level| on_heading(text, level)} }`
    `Marked.setOptions({ renderer: renderer })`
    @html = `Marked(#{@md})`
  end

  def on_heading text, level
    slug = text.downcase.gsub(/[^\w]+/g, '-')
    puts "XX #{slug} #{text} #{level}"
    "<h#{level} class='fred_heading_#{level}'>#{text}</h#{level}>"
  end

  def html
    @html
  end

end
