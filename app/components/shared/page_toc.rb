class ReactYahooSticky < Hyperloop::Component
  imports 'YahooSticky'
end

class PageToc < Hyperloop::Component
  #param :section_store
  param :history
  param :location
  param :section

  before_mount do

    if NavigationStore.accordionindex < 0
      NavigationStore.mutate.accordionindex -1
    end
  end


  render do
    
    Sem.Rail(close: true, dividing: false, position: 'left') do
      ReactYahooSticky(enable: true, top: 50) do
        DIV(class: 'ui sticky visible transition') do
          accordion if SiteStore.sections[params.section].loaded?
        end
      end
    end
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      SiteStore.sections[params.section].pages.each_with_index do |page, index|
        
        Sem.AccordionTitle(className: 'item', index: index, active: (NavigationStore.accordionindex===index)) do
          I(class: 'dropdown icon')
          B() { page[:headings][0][:text] }
        end.on(:click) do 
      
          newindex = (NavigationStore.accordionindex===index) ? -1 : index
          NavigationStore.mutate.accordionindex newindex

           Element['html, body'].animate({
             scrollTop: 0
           }, :slow)

          SiteStore.sections[params.section].set_current_page page
          NavigationStore.mutate.slug ""
          params.history.push "/#{params.section}/#{page[:name]}"
          force_update!

        end

        Sem.AccordionContent(className: 'menu', active: (NavigationStore.state.accordionindex===index)) do
          page[:headings].drop(1).each do |heading|
            
            if (heading[:level] < 4)
              A(class: "item #{'subitem' if (heading[:level]==3)}") { heading[:text] }
                .on(:click) do
                  slug = "#{heading[:slug]}"
                  #AppRouter.transition_to("/#{params.section}/#{page[:repo]}/#{page[:file]}/#{slug}")
                  #anchorchapter_position = Element["##{slug}"].offset().top
                  # Element['html, body'].animate({
                  #                         scrollTop: anchorchapter_position
                  #                       }, 500)
                  
                  params.history.push "/#{params.section}/#{page[:name]}/#{slug}"
                  NavigationStore.mutate.slug slug
                  #puts "SLUG: #{NavigationStore.state.slug}"
                  #`document.getElementById(#{slug}).scrollIntoView(true);`
                  #SiteStore.sections[params.section].set_current_page page
                  #puts "LOCATION: #{params.location.pathname}"
                  # force_update!
                end
            end
          end
        end
      end
    end
  end
end
