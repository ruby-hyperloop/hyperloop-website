class SearchResultModal < Hyperloop::Component


  render do

    ModalDialog() do

      HEADER() {"RESULTS LISTING"}
      P() { SearchEngineStore.inputvaluetoosmall }
      P() { SearchEngineStore.inputvalue }
      P() do 
        
        "Results: #{SearchEngineStore.allresults}"
        
      end

    end
        

  end


end