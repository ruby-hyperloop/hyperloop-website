class HomePage < Hyperloop::Router::Component

  before_mount do
    SidebarStore.hide
  end


  render do

    # sidebar = HomeSidebar().as_node
    # body = HomeBody().as_node

    # PageLayout(sidebar_component: sidebar, body_component: body, loaded: true)

    Sem.SidebarPushable(id: 'example', className: 'index') do
      SidebarMenu()      
      main_content
    end

  end


  def main_content

    Sem.SidebarPusher do


      DIV(class: 'full height') do

        DIV(class: 'following bar') do
          DIV(class: 'ui page grid') do
            DIV(class: 'column') do
              DIV(class: 'ui logo shape') do
                DIV(class: 'sides') do
                  DIV(class: 'active learn side') do
                    IMG(class: 'ui image', src: 'dist/images/hyperloop-logo.png')
                    #Link('/docs', class: 'item') { 'DOCUMENTATION' }

                  end
                  DIV(class: 'ui side') do
                    IMG(class: 'ui image', src: 'images/logo.png')
                  end
                end
              end
              DIV(class: 'ui inverted right floated secondary menu') do
                DIV(class: 'item') do
                  #IFRAME(class: 'github', src: 'http://ghbtns.com/github-btn.html?user=semantic-org&repo=semantic-ui&type=watch&count=true', allowTransparency: 'true', frameBorder: '0', scrolling: '0', width: '100', height: '20')
                end
                DIV(class: 'ui language floating dropdown link item', id: 'languages') do
                  I(class: 'world icon')
                  DIV(class: 'text') { 'English' }
                  DIV(class: 'menu')
                end
              end
              DIV(class: 'ui large inverted secondary network menu') do
                A(class: 'view-ui item') do
                  I(class: 'sidebar icon')
                  " Menu\n        "
                end.on(:click) {
                  SidebarStore.toggle
                }
                A(href: '', 'data-site' => 'ui', class: 'additional item') { 'Docs' }
                SPAN(class: 'additional item', 'data-site' => 'layout', 'data-content' => 'Coming Soon') { 'Themes' }
                SPAN(class: 'additional item', 'data-site' => 'layout', 'data-content' => 'Coming Soon') { 'Layouts' }
              end
            end
          end
        end

        DIV(class: 'masthead segment') do
          DIV(class: 'ui page grid') do
            DIV(class: 'column') do
              DIV(class: 'introduction') do
                H1(class: 'ui inverted header') do
                  SPAN(class: 'library') { 'Hyperloop' }
                end
                DIV(class: 'ui hidden divider')
                A(class: 'ui big basic inverted pink view-ui button getstartedbutton') do
                  I(class: 'sidebar icon')
                  "\n          Get Started\n        "
                end
              end
            end
          end
        end

        DIV(class: 'feature alternate ui vertical stripe segment') do
          DIV(class: 'ui three column equal height center aligned divided relaxed stackable page grid') do
            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/paint.png')
                'Simplicity'
              end
              P() { 'Build interactive Web applications quickly. Hyperloop encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperloop takes care of much of the hassle of Web development, so you can focus on innovation and delivering end-user value.' }
              A(href: '', class: 'ui secondary large button') { 'Simplicity' }
            end
            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/gear.png')
                'Isomorphic Ruby'
              end
              P() { 'One language. One model. One set of tests. The same business logic and domain models running on the clients and the server. Hyperloop is fully integrated with Rails and also gives you unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code. Hyperloop lets you build beautiful interactive user interfaces in Ruby.' }
              A(href: '', class: 'ui pink large button hyperlooppinkbutton') { 'Isomorphic Ruby' }
            end
            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/plugin.png')
                'Complete Architecture'
              end
              P() { 'Everything has a place in our architecture. Components deliver interactive user experiences, Operations encapsulate business logic, Models magically synchronize data between clients and servers, Policies govern authorization and Stores hold local state.' }
              A(href: '', class: 'ui black large button') { 'Complete Architecture' }
            end
          end
        end
      end
      
      AppFooter()
      



    end

  end



end
