class SiteSearch < Hyperloop::Component

  state results: []

  render(DIV) do
    Sem.Search(category: true, aligned: :right,
      onSearchChange: lambda { |e, value| search_change(e, value) },
      resultRenderer: lambda { |obj| render_result(obj) },
      categoryRenderer: lambda { |obj| render_category(obj) },
      results: state.results,
      loading: !SiteStore.loaded?
    )
  end

  def search_change e, v
    value = `e.target.value`
    mutate.results SiteStore.search_headings(value).to_n
  end

  def render_category obj
    SPAN do
      P { 'obj.text' }
    end.to_n
  end

  def render_result obj
    SPAN do
      P { `obj.text` }
    end.to_n
  end
end
