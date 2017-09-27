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

    def search_headings value
      data = []
      @section_stores.each do |section|
        a = {}
        a[:name] = section[0].upcase
        a[:results] = []
        pages = section[1].pages
        pages.each do |page|
          a[:results].concat( match_headings(page[:headings], value, page) )
        end
        data << a unless a[:results].size == 0
      end
      data
    end

    private

    def match_headings headings, value, page
      ret = []
      headings.each_with_index do |heading, index|
        if heading[:text].downcase.include?(value.downcase)
          heading[:friendly_doc_name] = page[:friendly_doc_name]
          heading[:repo] = page[:repo]
          heading[:file] = page[:file]
          heading[:key] = "#{index}-#{heading[:repo]}-#{heading[:file]}-#{heading[:slug]}"
          ret << heading
        end
      end
      ret
    end

    def init
      @section_stores = {}
      # FRED if the site is being loaded through a specific route, can we figure out which section to load first?
      load_start_section
      load_docs_section
    end

    def load_start_section
      pages = [
        { repo: 'hyperloop-website',     file: 'pages/start/components.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/stores.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/models.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/operations.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/policies.md',  allow_edit: true },
        { repo: 'hyperloop-website',     file: 'pages/start/pradgmatic.md',  allow_edit: true }
      ]
      @section_stores[:start] = SectionStore.new(pages)
    end

    def load_docs_section
      pages = [
        { repo: 'hyperloop-website', file: 'dist/dummy_DOCS.md',  allow_edit: true },
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
