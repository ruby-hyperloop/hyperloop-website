class SearchResultModalStore < Hyperloop::Store

  class << self
    state visible: false, scope: :shared, reader: true

    def hide
      mutate.visible false
      SearchEngineStore.mutate.inputvaluetoosmall ""
    end

    def show
      mutate.visible true
    end

    def toggle
      mutate.visible !state.visible
    end
  end
end