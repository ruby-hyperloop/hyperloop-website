class HomePageBis < Hyperloop::Router::Component


  render do
    
    DIV(class: 'outer-container') do
      DIV(class: 'menu') do
        B() { "I am a fixed header!" }
      end

      BurgerMenu.Menu(pagewrapid: 'page-wrap', outercontainerid: 'outer-container') do
        A() {"Link 1"}
        A() {"Link 2"}
      end
      
      DIV(class: 'page-wrap') do

        P() {"hello"}

      end
    end


  end



end 