class SiteSearch < Hyperloop::Component

  state results: []
  state value: ""

  param :section
  

  param options: [
    { key: 'docs', text: 'Documentation', value: 'docs' },
    { key: 'start', text: 'Get started', value: 'start' },
    { key: 'tutorials', text: 'Tutorials', value: 'tutorials' }
  ]


  render do
    search_control
  end

  # def search_control_old
  #   Sem.Search(category: true, aligned: :left,
  #     resultRenderer: lambda { |obj| render_result(obj) },
  #     categoryRenderer: lambda { |obj| render_category(obj) },
  #     results: state.results,
  #     value: state.value,
  #     loading: !SiteStore.loaded?
  #   ) { }
  #   .on(:searchChange) do |e|
  #     mutate.value e.target.value
  #     if (e.target.value.length > 4) 
  #       #mutate.results SiteStore.search_content(state.value, params.section).to_n
  #       resultat = SiteStore.search_content(state.value, params.section)
  #       puts "RESULTS: #{resultat[0][:results][0][:text]}"
  #     end
  #   end
  #   .on(:resultSelect) do |e, data|
  #     puts data.result.text
  #     mutate.value data.result.text
  #     SiteStore.sections[params.section].set_current_page data.result.page
  #         #params.history.push "/#{params.section}/#{page[:repo]}/#{page[:file]}"
  #     #force_update!
  #     #{}"/#{params.section}/#{data.result.repo}/#{data.result.file}"
  #     puts data.result.repo
  #     puts data.result.file
  #     puts data.result.slug
  #   end
  # end

  def search_control
    Sem.Input(iconPosition: 'left', placeholder: 'Search ...', action: true) do
      INPUT(){}.on(:change) do |e|
       #SearchEngineStore.mutate.inputvalue e.target.value
       mutate.value e.target.value
      end
      Sem.Icon(name: 'search')
      Sem.Select(compact: true, options: params.options.to_n, defaultValue: params.section.to_n )
      Sem.Button() {'Search'}.on(:click) do

        SearchResultModalStore.show


        if (state.value.length>4)
          if (SearchEngineStore.inputvalue != state.value)
            #puts "VALUE : #{state.value}"
            SearchEngineStore.mutate.inputvalue state.value
            SearchEngineStore.mutate.allresults nil
            
            if (SearchResultModalStore.visible)
              SearchEngineStore.search_content(params.section)
            end
          end
        else
          SearchEngineStore.mutate.inputvalue ""
          SearchEngineStore.mutate.allresults nil
          SearchEngineStore.mutate.inputvaluetoosmall "Please provide a search value > 4"
        end
        
      end
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
    #SearchResult().to_n
  end

  def render_category obj
    SPAN do
      H1 { `obj.name` }
      EM { "#{`obj.result_number`} results" }
    end.to_n
    
  end
end

# class SearchResult < Hyperloop::Component
#   param :friendly_doc_name
#   param :heading_text

#   render(DIV) do
#     H4 { params.heading_text }
#     EM { params.friendly_doc_name }
#   end
# end
