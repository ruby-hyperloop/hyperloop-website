class PageToc < Hyperloop::Component

  param :section_store

  render do
    DIV(class: 'accordian-div') { accordion } if params.section_store.loaded?
  end

  def accordion
    panels = []
    params.section_store.pages.each_with_index do |page, index|
      panels << { title: toc_heading(page, page[:headings][0]).as_node,
                    content: panel(page).as_node,
                    key: index.to_s
      }
    end
    Sem.Accordion(panels: panels.to_n, styled: true, fluid: true)
  end

  def panel page
    UL do
      page[:headings].drop(1).each do |heading|
        toc_item(page, heading)
      end
    end
  end

  def toc_heading page, heading
    SPAN(class: 'header'){ heading[:text] }.on(:click) do
      # slug = "#{params.heading[:slug]}"
      # `document.getElementById(#{slug}).scrollIntoView(true);`
      params.section_store.set_current_page page
      force_update!
    end
  end

  def toc_item page, heading
    LI(class: "toc_h#{heading[:level]}") do
      A { "#{heading[:text]}" }.on(:click) do
        # slug = "#{params.heading[:slug]}"
        # `document.getElementById(#{slug}).scrollIntoView(true);`
        params.section_store.set_current_page page
        force_update!
        # params.section_store.set_current_anchor params.heading[:slug]
        end
      end
  end


end
