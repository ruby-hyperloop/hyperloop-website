class SiteSearch < Hyperloop::Component

  state results: []

  render(DIV) do
    get_search_data if @search_data == nil && SiteStore.loaded?
    Sem.Search(category: true, aligned: :right,
      onSearchChange: lambda { |e, value| search_change(e, value) },
      resultRenderer: lambda { |obj| render_result(obj) },
      results: state.results,
      loading: !SiteStore.loaded?
    )
  end

  def search_change e, v
    value = `e.target.value`
    mutate.results @search_data.to_n
    # puts @search_data
  end

  def render_result obj
    DIV do
      H4 { `obj.text`  }
      # P { 'obj.descriptiom' }
    end.to_n
  end

  def get_search_data
    t = [{name: 'dog things', results: [
        { title: 'Alfie is sleeping', descriptiom: 'He is always on the bed' },
        { title: 'Alfie is eating', descriptiom: 'He is always eating a bone wherever he can' }
      ]}
    ]
    puts t
    puts "get search data"
    @search_data = SiteStore.search_data
    puts @search_data
  end

end
