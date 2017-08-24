
class Page < Hyperloop::Component

  render(DIV) do
    BUTTON { "Local: HyperModel DOCS" }.on(:click) do
      HTTP.get('/DOCS.md') do |response|
        md = MdConverter.new(response.body)
        mutate.html md.html
        mutate.code_blocks md.code_blocks
        mutate.headings md.headings
      end
    end

    BUTTON { "Github: HyperComponent DOCS" }.on(:click) do
      HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
        md = MdConverter.new(response.body)
        mutate.html md.html
        mutate.code_blocks md.code_blocks
        mutate.headings md.headings
      end
    end

    Sem.Divider()
    DIV { "Headings: #{state.headings.count}" } unless state.headings.nil?
    DIV { "Code blocks: #{state.code_blocks.count}" } unless state.code_blocks.nil?
    DIV(dangerously_set_inner_HTML: { __html: state.html })
  end

end
