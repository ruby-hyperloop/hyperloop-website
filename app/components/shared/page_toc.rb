class PageToc < Hyperloop::Component

  param :section_store

  render do

    Sem.Rail(close: true, dividing: false, position: 'left') do
      
      
      DIV(class: 'ui sticky visible transition') do
        
        accordion if params.section_store.loaded?
        
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
          params.section_store.set_current_page page
          force_update!

        end

        
        Sem.AccordionContent(className: 'menu') do
          page[:headings].drop(1).each do |heading|

            if (heading[:level] < 4)
              A(class: "item #{'subitem' if (heading[:level]==3)}") { heading[:text] }
                .on(:click) do
                  slug = "#{heading[:slug]}"
                  `document.getElementById(#{slug}).scrollIntoView(true);`
                  params.section_store.set_current_page page
                  force_update!
                end
            end

          end
        end

      end

    end
      
      
  end

  


end
