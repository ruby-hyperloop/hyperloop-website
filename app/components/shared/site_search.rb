class SiteSearch < Hyperloop::Component

  state results: []

  render(DIV) do
    Sem.Search(category: true, aligned: :right,
      onSearchChange: lambda { |e, value| search_change(e, value) },
      resultRenderer: lambda { |obj| render_result(obj) },
      results: state.results,
      loading: !SiteStore.loaded?
    )
  end

  def search_change e, v
    value = `e.target.value`
    # mutate.results @search_data.to_n
    mutate.results SiteStore.search_headings(value).to_n
    # puts @search_data
  end

  def render_result obj
    DIV do
      P { `obj.text` }
      # P { 'obj.descriptiom' }
    end.to_n
    # SearchResult()
  end
end

# class SearchResult < Hyperloop::Component
#   render do
#     H1 {"here"}
#   end
# end
