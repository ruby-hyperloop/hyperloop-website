class SiteSearch < Hyperloop::Component

  state results: []
  state value: ""

  render do
    search_control
  end

  def search_control
    Sem.Search(category: true, aligned: :right,
      resultRenderer: lambda { |obj| render_result(obj) },
      results: state.results,
      value: state.value,
      loading: !SiteStore.loaded?
    ) { }
    .on(:searchChange) do |e|
      mutate.value e.target.value
      mutate.results SiteStore.search_headings(state.value).to_n
    end
    .on(:resultSelect) do |e, data|
      puts data.result.text
      mutate.value data.result.text
      puts "FRED - you will need to route to.. '#{data.result.text}'"
      puts data.result.repo
      puts data.result.file
      puts data.result.slug
    end
  end

  def render_result obj
    #  FRED I don't know why we get the warnings about props on a div and a missing key
    #  clearly this is not where to declare these props, I have tried everything
    # React.create_element(SearchResult, {friendly_doc_name: `obj.friendly_doc_name`, heading_text: `obj.text`} ).to_n
    # a local HTML element feels faster ro tun than a component being created.... Same warning in both cases though
    SPAN do
      H4 { `obj.text` }
      EM { `obj.friendly_doc_name` }
    end.to_n
    # SearchResult().to_n
  end
end

# class SearchResult < Hyperloop::Component
#   param :friendly_doc_name
#   param :heading_text
#
#   render(DIV) do
#     H4 { params.heading_text }
#     EM { params.friendly_doc_name }
#   end
# end
