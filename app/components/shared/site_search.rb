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
    mutate.results SiteStore.search_headings(value).to_n
  end

  def render_result obj
    #  FRED I don't know why we get the warnings about props on a div and a missing key
    #  clearly this is not where to declare these props, I have tried everything
    r=rand(2**256).to_s(36)[0..7]
    React.create_element(SearchResult, {slug: `obj.slug`, text: `obj.text`, key: r} ).to_n
  end
end

class SearchResult < Hyperloop::Component
  param :slug
  param :text

  render do
    P { params.text }
  end
end
