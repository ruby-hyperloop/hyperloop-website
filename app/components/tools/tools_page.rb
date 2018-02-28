class ToolsPage < Hyperloop::Router::Component
  
    render(DIV) do
      imgcomp = Sem.Image(size: 'small', src: 'http://via.placeholder.com/140x100').as_node
      #imgcomp2 = [ Sem.Image(size: 'small', src: 'http://via.placeholder.com/140x100').as_node, span{'text'}.as_node, span{'text'}.as_node ]
      SemImage(imagecomponent: imgcomp)
      span{'text'}
      span{'text'}
    end

end
