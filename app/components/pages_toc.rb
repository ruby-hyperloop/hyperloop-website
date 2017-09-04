class PagesToc < Hyperloop::Component
  param :pages

  before_mount do
  end

  # render do
  #
  #   DIV(class: 'tocmenu') do
  #     Sem.Menu(vertical:true, size: :huge, inverted: false, compact: true ) do
  #       params.pages.each_with_index do |page, index|
  #         # puts "HEADING: #{page[:md_converter].headings}"
  #         DIV(class: 'item') do
  #           TocHeading(heading: page[:md_converter].headings[0])
  #           DIV(class: 'menu') { tocpanel(page[:md_converter].headings.drop(1)) }
  #         end
  #       end
  #     end
  #   end
  #
  # end

  render(DIV) do

    panels = []
    params.pages.each_with_index do |page, index|
      # puts "HEADING: #{page[:md_converter].headings}"
      panels << { title: TocHeading(heading: page[:md_converter].headings[0]).as_node,
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
          TocItem(heading: heading)
        end
      end
    end
  end

  # def tocpanel panel
  #     panel.each do |heading|
  #       TocItem(heading: heading)
  #     end
  #
  # end
end

class TocHeading < Hyperloop::Component
  param :heading
  render do
    SPAN(class: 'header'){ params.heading[:text] }.on(:click) do
      slug = "#{params.heading[:slug]}"
      `document.getElementById(#{slug}).scrollIntoView(true);`
    end
  end
end

class TocItem < Hyperloop::Component
  param :heading
  render do

    LI(class: "toc_h#{params.heading[:level]}") do
      A { "#{params.heading[:text]}" }.on(:click) do
        slug = "#{params.heading[:slug]}"
        `document.getElementById(#{slug}).scrollIntoView(true);`
        end
      end
  end
end
