
class Page < Hyperloop::Component

  render(DIV) do
    BUTTON { "Get local DOCS" }.on(:click) do
      HTTP.get('/DOCS.md') do |response|
        md = MdConverter.new(response.body)
        mutate.html md.html
      end
    end

    BUTTON { "Get Github DOCS" }.on(:click) do
      HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
        md = MdConverter.new(response.body)
        mutate.html md.html
      end
    end


    DIV(dangerously_set_inner_HTML: { __html: state.html })
  end

end
