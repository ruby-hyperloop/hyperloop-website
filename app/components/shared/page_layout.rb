class PageLayout < Hyperloop::Router::Component
  param :sidebar_component
  param :body_component
  param :page_title
  param :loaded

  before_mount do
    SidebarStore.hide
  end

  # after_mount do
  #   `$('#menu').sidebar({
  #     transition: 'overlay', 
  #     mobileTransition: 'uncover',
  #     context: $('#example')
  #   }).sidebar('attach events', '.launch.button')`
  # end

  render do

    # Sem.Dimmer(active: (params.loaded ? false : true), inverted: true) {
    #   Sem.Loader(inverted: true, size: :large, content: 'Loading dynamic content...')
    # }

    Sem.SidebarPushable(id: 'example') do
    
        SidebarMenu()  
        top_menu
        sidebar_toggle
        main_content
      
    end

  end


  def top_menu

    DIV(class: 'ui fixed inverted main menu') do
      DIV(class: 'container') do
        A(class: 'launch item') do
          I(class: 'content icon')
        end
        DIV(class: 'title item') do
          # B() { 'Developing:' }
          # " Customization Guide\n      "
        end
        
        DIV(class: 'right menu') do
          DIV(class: 'vertically fitted borderless item') do
            IFRAME(class: 'github', src: 'http://ghbtns.com/github-btn.html?user=ruby-hyperloop&repo=hyperloop&type=watch&count=true', allowTransparency: 'true', frameBorder: '0', scrolling: '0', width: '100', height: '20')
          end
          A(class: 'popup icon github item', 'data-content' => 'View project on GitHub', href: 'https://github.com/ruby-hyperloop/hyperloop') do
            I(class: 'alternate github icon')
          end
        end
      end
    end

  end



  def sidebar_toggle

    DIV(class: 'ui black big launch right attached fixed button') do
      I(class: 'content icon')
      SPAN(class: 'text') { 'Menu' }
    end.on(:click) {
      SidebarStore.toggle
    }

  end



  def main_content

    Sem.SidebarPusher do
    #DIV(class: 'pusher') do

      DIV(class: 'full height') do
        top_menu
        DIV(class: 'header segment') do
          DIV(class: 'container') do
            DIV(class: 'introduction') do
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

    end.on(:click) {
      SidebarStore.hide
    }

  end



end
