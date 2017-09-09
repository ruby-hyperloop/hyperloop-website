class SiteStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self

    def sections
      @section_stores
    end

    private

    def init
      @section_stores = {}
      # if the site is being loaded through a specific route, can we figure out which section to load first?
      load_start_section
      load_docs_section
    end

    def load_start_section
      pages = [
        { repo: 'hyperloop-website',     file: 'pages/start/components.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/stores.md',  allow_edit: true }
      ]
      @section_stores[:start] = SectionStore.new(pages)
    end

    def load_docs_section
      pages = [
        # { repo: 'hyperloop-website', file: 'dist/dummy_DOCS.md',  allow_edit: true },
        { repo: 'hyper-react',     file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-store',     file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-router',    file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-mesh',      file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-operation', file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-operation', file: 'DOCS-POLICIES.md',  allow_edit: true }
      ]
      @section_stores[:docs] = SectionStore.new(pages)
    end

  end

end
