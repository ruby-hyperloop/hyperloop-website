class PagesToc < Hyperloop::Component
  param :pages

  # # render(DIV) do
  #   # H3 { LI { params.page[:repo].to_s } }
  #   UL {
  #     params.page[:md_converter].headings.each do |heading|
  #       LI(class: "toc_h#{heading[:level]}") { heading[:text] }
  #     end if params.page[:md_converter]
  #   }
  # # end

  render(DIV) do
    panels = []
    params.pages.each_with_index do |page, index|
      panels << { title: page[:md_converter].headings[0].to_s,
                    content: panel(page).as_node,
                    key: index
      }
    end
    Sem.Accordion(panels: panels.to_n, styled: false, fluid: true)
  end

  def panel page
    DIV do
      page[:md_converter].headings.drop(1).each do |heading|
        LI(class: "toc_h#{heading[:level]}") { heading[:text] }
      end
    end
  end

end
