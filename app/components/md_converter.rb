# https://www.npmjs.com/package/marked#block-level-renderer-methods

class MdConverter
  def initialize md
    @md = md
    process
  end

  def process
    `var renderer = new Marked.Renderer()`
    `renderer.heading = #{lambda {|text, level| on_heading(text, level)} }`
    `renderer.code = #{lambda {|code, lang| on_code(code, lang)} }`
    `renderer.codespan = #{lambda {|code| on_codespan(code)} }`

    `Marked.setOptions({ renderer: renderer })`
    @html = `Marked(#{@md})`
  end

  def on_code code, lang
    "<pre><code class='lang-#{lang} hljs'>#{ highlight(code, lang) }</code></pre>"
  end

  def on_codespan code
    puts code
    "<code class='inline-codespan'>#{ code }</code>"
  end

  def highlight code, lang=nil
    `hljs.highlightAuto(#{code}).value`
  end

  def on_heading text, level
    # slug = text.downcase.gsub(/[^\w]+/g, '-')
    # puts "XX #{slug} #{text} #{level}"
    "<h#{level} class='doc_h#{level}'>#{text}</h#{level}>"
  end

  def html
    @html
  end

end
