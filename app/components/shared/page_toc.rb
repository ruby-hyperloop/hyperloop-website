class ReactYahooSticky < Hyperloop::Component
  imports 'YahooSticky'
end

class PageToc < Hyperloop::Component
  param :section_store
  param :history
  param :section

  render do
    Sem.Rail(close: true, dividing: false, position: 'left') do
      ReactYahooSticky(enable: true, top: 50) do
        DIV(class: 'ui sticky visible transition') do
          accordion if params.section_store.loaded?
        end
      end
    end
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      params.section_store.pages.each_with_index do |page, index|
        Sem.AccordionTitle(as: 'A', className: 'item') do
          I(class: 'dropdown icon')
          B() { page[:headings][0][:text] }
        end.on(:click) do

           Element['html, body'].animate({
             scrollTop: 0
           }, :slow)
          params.section_store.set_current_page page
          params.history.push "/#{params.section}/#{page[:repo]}/#{page[:file]}"
          force_update!

        end

        Sem.AccordionContent(className: 'menu') do
          page[:headings].drop(1).each do |heading|
            if (heading[:level] < 4)
              A(class: "item #{'subitem' if (heading[:level]==3)}") { heading[:text] }
                .on(:click) do
                  slug = "#{heading[:slug]}"
                  anchorchapter_position = Element["##{slug}"].offset().top
                  Element['html, body'].animate({
                                          scrollTop: anchorchapter_position-85
                                        }, 500)
                  params.history.push "/#{params.section}/#{page[:repo]}/#{page[:file]}/#{slug}"
                  #`document.getElementById(#{slug}).scrollIntoView(true);`
                  params.section_store.set_current_page page
                  # force_update!
                end
            end
          end
        end
      end
    end
  end
end
