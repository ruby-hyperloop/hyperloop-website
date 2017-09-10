class SiteSearch < Hyperloop::Component

  state results: []

  render(DIV) do
    Sem.Search(category: false,
      onSearchChange: lambda { |e, value| search_change(e, value) },
      resultRenderer: lambda { |obj| render_result(obj) },
      results: state.results
      # loading: SiteStore.loading?
    )
  end

  def search_change e, v
    value = `e.target.value`
    # can be result.title
    # mutate.results @options.to_n
    mutate.results [
      { title: 'Alfie is sleeping', descriptiom: 'He is always on the bed' },
      { title: 'Alfie is eating', descriptiom: 'He is always eating a bone wherever he can' }
    ].to_n
  end

  def render_result obj
    # puts "render"
  #   # `debugger;`
  #   # puts obj
  #   Sem.Label(key: '1', title: "Hello").as_node.to_n
    SPAN { `obj.descriptiom` }.to_n
  end

  def reset
    @options = [
      { title: 'Alfie is sleeping', descriptiom: 'He is always on the bed' },
      { title: 'Alfie is eating', descriptiom: 'He is always eating a bone wherever he can' }
    ]
  end

end
