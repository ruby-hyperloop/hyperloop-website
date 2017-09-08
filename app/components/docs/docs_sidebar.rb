class DocsSidebar < Hyperloop::Component
  param :page_store

  render(DIV) do
    Sem.Menu(fixed: :left, vertical: true, size: :huge, inverted: false, compact: true, fluid: true ) do
      accordion
    end if params.page_store.loaded?
  end

  def accordion
    panels = []
    params.page_store.pages.each_with_index do |page, index|
      panels << { title: TocHeading(page_store: params.page_store, page: page, heading: page[:md_converter].headings[0]).as_node,
                    content: panel(page).as_node,
                    key: index.to_s
      }
    end

    DIV(class: 'accordian-div') {
      Sem.Segment(basic: true) {
        Sem.Header(as: 'h3') { "COMPS Documentation" }
      }
      Sem.Accordion(panels: panels.to_n, styled: true, fluid: true)
    }
  end

  def panel page
    DIV(class: 'toc-div') do
      UL do
        page[:md_converter].headings.drop(1).each do |heading|
          TocItem(page_store: params.page_store, heading: heading, page: page)
        end
      end
    end
  end

end

class TocHeading < Hyperloop::Component
  param :page
  param :heading
  param :page_store

  render do
    SPAN(class: 'header'){ params.heading[:text] }.on(:click) do
      # slug = "#{params.heading[:slug]}"
      # `document.getElementById(#{slug}).scrollIntoView(true);`
      params.page_store.set_current_page params.page
      force_update!
    end
  end
end

class TocItem < Hyperloop::Component
  param :page
  param :heading
  param :page_store

  render do

    LI(class: "toc_h#{params.heading[:level]}") do
      A { "#{params.heading[:text]}" }.on(:click) do
        # slug = "#{params.heading[:slug]}"
        # `document.getElementById(#{slug}).scrollIntoView(true);`
        params.page_store.set_current_page params.page
        force_update!
        # params.page_store.set_current_anchor params.heading[:slug]
        end
      end
  end
end
