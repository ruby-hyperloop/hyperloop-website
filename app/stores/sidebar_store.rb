class SidebarStore < Hyperloop::Store

  class << self
    state visible: true, scope: :shared, reader: true

    def toggle
      mutate.visible !state.visible
    end
  end
end
