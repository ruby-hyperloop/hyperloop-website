
class Page < Hyperloop::Component
  param :url

  after_mount do
    HTTP.get(params.url) do |response|
      md = MdConverter.new(response.body)
      mutate.html md.html
      mutate.code_blocks md.code_blocks
      mutate.headings md.headings
    end
  end

  render do
    Sem.Grid do
      Sem.GridRow(columns: 2) do
        Sem.GridColumn(width: 4) do
          side_nav
        end
        Sem.GridColumn(width: 12) do
          body
        end
      end
    end
  end

  def search
    Sem.Input(placeholder: 'Search', fluid: true).on(:change) do |e|
      mutate.search e.target.value
    end
  end

  def side_nav
    Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) do
      Sticky {
        search
        # BR()
        H4 {"Sections"}
        state.headings.each do |heading|
          if state.search
            P { heading[:text] } if heading[:text].downcase.include?(state.search.downcase)
          else
            P { heading[:text] }
          end
        end if state.headings

        # BR()
        H4 {"Code"} unless state.search == ""
        state.code_blocks.each do |code|
          if state.search != "" && code[:code].downcase.include?(state.search.downcase)
            PRE(class: 'hljs') {
              DIV(dangerously_set_inner_HTML: { __html: code[:html] })
            }
            # BR()
          end
        end  if state.code_blocks && state.search

      }
      end
  end

  def body
    Sem.Container(style: { marginTop: '2em', paddingRight: '28px' }) do
      DIV(dangerously_set_inner_HTML: { __html: state.html })
    end
  end
end
