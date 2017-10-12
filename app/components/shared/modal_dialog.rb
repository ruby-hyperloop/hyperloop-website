class ModalDialog < Hyperloop::Component

  render do

    Sem.Modal(size: :large,open: (SearchResultModalStore.visible ? true : false)) do
      Sem.ModalHeader {"Search Results: "}
      Sem.ModalContent(image: true, scrolling: true) do
        Sem.Image(size: 'massive', src: 'dist/images/hyperloop-logo-title.png', wrapped: true) {}
        Sem.ModalDescription() do
          
          children.each(&:render)
          
        end
      end
      Sem.ModalActions do
        Sem.Button(negative: true) {"Close"}.on(:click) {SearchResultModalStore.hide}
        
      end
    end

    

  end

end