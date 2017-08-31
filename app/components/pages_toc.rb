class PagesToc < Hyperloop::Component
  param :pages

  before_mount do
  end

  render(DIV) do
    panels = []
    params.pages.each_with_index do |page, index|
      panels << { title: TocHeading(heading: page[:md_converter].headings[0]).as_node,
                    content: panel(page).as_node,
                    key: index.to_s
      }
    end
    Sem.Accordion(panels: panels.to_n, styled: false, fluid: true)
  end

  def panel page
    DIV do
      page[:md_converter].headings.drop(1).each do |heading|
        TocItem(heading: heading)
      end
    end
  end
end

class TocHeading < Hyperloop::Component
  param :heading
  render do
    SPAN { params.heading[:text] }.on(:click) do
      slug = "#{params.heading[:slug]}"
      `document.getElementById(#{slug}).scrollIntoView(true);`
    end
  end
end

class TocItem < Hyperloop::Component
  param :heading
  render(DIV) do
    LI(class: "toc_h#{params.heading[:level]}") { params.heading[:text] }.on(:click) do
      slug = "#{params.heading[:slug]}"
      `document.getElementById(#{slug}).scrollIntoView(true);`
    end
  end
end
