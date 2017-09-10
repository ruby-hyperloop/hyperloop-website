class SiteStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self

    def sections
      @section_stores
    end

    def loaded?
      ret = true
      @section_stores.each do |section|
        ret = false unless section[1].loaded?
      end
      ret
    end

    def search_data
      data = []
      @section_stores.each do |section|
        a = {}
        a[:name] = section[0]
        a[:results] = []
        pages = section[1].pages
        pages.each do |page|
          a[:results].concat page[:headings]
        end
        data << a
      end
      data
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
