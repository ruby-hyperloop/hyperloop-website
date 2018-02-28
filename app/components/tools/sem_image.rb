class SemImage < Hyperloop::Component
  param :imagecomponent
  
  render(DIV) do
    params.imagecomponent.render
  end

end