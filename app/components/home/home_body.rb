class HomeBody < Hyperloop::Component
  render(DIV) do
    H1 { "Home body" }

    Sem.FormRadio(label: 'Small',
                  checked: (state.active_item == :sm),
                  onChange: -> {mutate.active_item :sm})
    Sem.FormRadio(label: 'Medium',
                  checked: (state.active_item == :md),
                  onChange: -> {mutate.active_item :md})
    Sem.FormRadio(label: 'Large',
                  checked: (state.active_item == :lg),
                  onChange: -> {mutate.active_item :lg})

    P { "The selected one is #{state.active_item.to_s}" }

    Sem.Input(label: 'First name', placeholder: 'First name please').on(:change) do |e|
      mutate.first_name e.target.value
    end
    P { "Your first name is #{state.first_name}" }

  end
end
