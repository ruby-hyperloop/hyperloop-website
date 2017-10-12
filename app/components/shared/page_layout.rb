class PageLayout < Hyperloop::Router::Component
  param :sidebar_component
  param :body_component
  param :page_title
  param :loaded
  param :section
  # param :history

  

  before_mount do
    SidebarStore.hide  
  end

  after_mount do
    Element['.bm-overlay'].on(:click) {
      SidebarStore.hide
    }

    # Element['.ui.page.modals'].on(:click) {
    #   mutate.modalvisibility false
    # }
  end

  

  render do

    # Sem.Dimmer(active: (params.loaded ? false : true), inverted: true) {
    #   Sem.Loader(inverted: true, size: :large, content: 'Loading dynamic content...')
    # }

    DIV(id: 'example', class: 'index') do
       
        SidebarMenu()  
        
        DIV(class: 'page-wrap') do
          main_content
        end
      
    end

  end


  
  def main_content

      

      DIV(class: 'full height') do

        AppMenu(section: params.section, history: history, location: location)
        
        DIV(class: 'header segment') do
          DIV(class: 'container') do
            DIV(class: 'introductiontitle') do
              DIV(class: 'ui huge header') { params.page_title }
              P() { 'The Complete Isomorphic Ruby Framework' }
            end
          end
        end

        DIV(class: 'main container') do

          params.sidebar_component.render

          params.body_component.render

        end
      end
      
      AppFooter()

      SearchResultModal(history: history)

      # test1 =  SearchEngineStore.lunr_section_searchindex[:start].map{|element| Hash.new(element)}
      #   puts "+++++++++++++++++++++++++++++++++++++++++++++++SECIONINDEX : --- SECTION: START DETAIL: #{test1}"


      #   test2 =  SearchEngineStore.lunr_section_searchindex[:docs].map{|element| Hash.new(element)}
      #   puts "+++++++++++++++++++++++++++++++++++++++++++++++SECIONINDEX : --- SECTION: DOCS DETAIL: #{test2}"

      

    

  end



end
