class PageStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self
    state loaded: false, scope: :shared

    def pages
      @@pages
    end

    def loaded?
      state.loaded
    end

    def init
      @@pages = [
        { repo: 'hyper-react',     file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-store',     file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-router',    file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-mesh',      file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-operation', file: 'DOCS.md',  allow_edit: true },
        { repo: 'hyper-operation', file: 'DOCS-POLICIES.md',  allow_edit: true }
      ]
      load_and_convert_pages
    end

    def load_and_convert_pages
      @@promises = 0

      @@pages.each do |page|
        get(page)
      end
    end

    def get page
      @@promises += 1
      HTTP.get( raw_url(page) ) do |response|
        if response.ok?
          page[:md_converter] = MdConverter.new(response.body)
          page[:edit_url] = edit_url page
        else
          alert "Unable to get #{raw_url(page)} from Github"
        end
        @@promises -= 1
        mutate.loaded true if @@promises == 0
      end
    end

    def raw_url page
      "https://raw.githubusercontent.com/ruby-hyperloop/#{page[:repo]}/master/#{page[:file]}"
    end

    def edit_url page
      "https://github.com/ruby-hyperloop/#{page[:repo]}/edit/master/#{page[:file]}"
    end
  end
end
