class PagesToc < Hyperloop::Component
  param :pages

  before_mount do
  end

  render(DIV) do
    panels = []
    params.pages.each_with_index do |page, index|
      puts "HEADING: #{page[:md_converter].headings[0]['text']}"
      panels << { title: TocHeading(heading: page[:md_converter].headings[0]).as_node,
                    content: panel(page).as_node,
                    key: index.to_s
      }
    end
    Sem.Accordion(panels: panels.to_n, styled: true, fluid: true)
  end

  def panel page
    UL do
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
  render do
    

    LI(class: "toc_h#{params.heading[:level]}") do
        A { params.heading[:text] }.on(:click) do
        slug = "#{params.heading[:slug]}"
        `document.getElementById(#{slug}).scrollIntoView(true);`
      end
    end

  end
end
