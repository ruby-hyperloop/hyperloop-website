# https://www.npmjs.com/package/marked#block-level-renderer-methods

class MdConverter
  def initialize md
    @md = md.gsub 'ruby runable', 'ruby-runable' #the space messes up the parsing
    @headings = []
    @code_blocks = []
    process
  end

  def html
    @html
  end

  def code_blocks
    @code_blocks
  end

  def headings
    @headings
  end

  def process
    `var renderer = new Marked.Renderer()`
    `renderer.heading = #{lambda {|text, level| on_heading(text, level)} }`
    `renderer.code = #{lambda {|code, lang| on_code(code, lang)} }`
    `renderer.codespan = #{lambda {|code| on_codespan(code)} }`
    `renderer.blockquote = #{lambda {|quote| on_blockquote(quote)} }`
    `renderer.table = #{lambda {|header, body| on_table(header, body)} }`

    `Marked.setOptions({ renderer: renderer })`
    @html = `Marked(#{@md})`
  end

  def on_table header, body
    "<table class='ui celled table'><thead class>#{header}</thead><tbody class>#{body}</tbody></table>"
  end

  def on_code code, lang
    cb = {}
    cb[:html] = highlight code, lang
    cb[:code] = code
    cb[:lang] = lang
    @code_blocks << cb
    "<pre><code class='lang-#{lang} hljs'>#{ cb[:html] }</code></pre>"
  end

  def on_codespan code
    "<code class='inline-codespan'>#{ code }</code>"
  end

  def highlight code, lang=nil
    `hljs.highlightAuto(#{code}).value`
  end

  def on_blockquote quote
    "<div class='ui cards'><div class='ui card fluid'><div class='content'>#{quote}</div></div></div>"
  end

  def on_heading text, level
    heading = {}
    heading[:text] = text
    heading[:level] = level
    heading[:slug] = text.downcase.gsub(/[^\w]+/g, '-')
    @headings << heading
    "<h#{level} class='doc_h#{level}' id='#{heading[:slug]}'>#{text}</h#{level}>"
  end

end
