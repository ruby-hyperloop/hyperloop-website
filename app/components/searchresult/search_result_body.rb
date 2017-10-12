
class SearchResultBody < Hyperloop::Router::Component
  
  param :history
  param :location
  param :section


  def gotoslug slug, sectionname, pageid
    
    NavigationStore.mutate.slug ""
    pagetogo = SiteStore.sections[sectionname].pages[pageid]
    SiteStore.sections[sectionname].set_current_page pagetogo
     
    NavigationStore.mutate.accordionindex pageid
    NavigationStore.mutate.slug slug

    history.push "/#{sectionname}/#{pagetogo[:name]}/#{slug}"
        
  end

  def highlight(text, search_string)
    keywords = search_string.strip.split(" ").compact.uniq
    matcher = Regexp.new( '(' + keywords.join("|") + ')' )
    highlighted = text.gsub(matcher) { |match| "<a class='ui teal label'>#{match}</a>" }
    return highlighted
  end



  render do
    
    DIV(class: 'searchresultcontent') do


      
      SearchEngineStore.allresults.each_with_index do |result, index|

        resulthtmlparagraph = ""
        resultpagename = ""
        resultheadingname = ""
        resultheadingslug = ""
        resultsectionname = ""
        resultpageid = ""
      
        SiteStore.sections[SearchEngineStore.previoussectionquery].pages.each_with_index do |page, index| 
          
          page[:headings].each do |heading|
            if (heading[:id] == result[:ref]) 
              resultsectionname = heading[:sectionname]
              resultpageid = heading[:pageid]
              resultpagename = heading[:pagename]
              resultheadingname = heading[:text]
              resultheadingslug = heading[:slug]
              resulthtmlparagraph = heading[:paragraphs].join(' ')
            end
          end

        end      
        

        H2(class: 'ui header') do
          IMG(src: 'dist/images/icons/gear.png')
          DIV(class: 'content') do
          
            A() do 
              DIV(dangerously_set_inner_HTML: 
                { __html: 
                  "#{index+1}. In #{resultpagename}: #{highlight(resultheadingname, result[:matchingwords]) } <a class='ui black label'>#{result[:nbresults]} results</a>" 
                })
              
            end.on(:click) { gotoslug(resultheadingslug, resultsectionname, resultpageid) }

            # A(class:'ui black label') {"#{result[:nbresults]} results" } 

            DIV(class: 'sub header') do
              "_______________"
            end

          end
          
        end

        DIV(dangerously_set_inner_HTML: { __html: highlight(resulthtmlparagraph, result[:matchingwords]) })
        
        BR()
      end

    end
    

  end




end