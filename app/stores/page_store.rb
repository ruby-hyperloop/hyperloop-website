class PageStore < Hyperloop::Store

  class << self

    state pages: nil, scope: :class

    def pages
      init unless state.pages
      state.pages
    end

    def init
      mutate.pages [
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
      state.pages.each do |page|
        HTTP.get( raw_url(page) ) do |response|
          puts "response"
          page[:md_converter] = MdConverter.new(response.body)
          page[:edit_url] = edit_url page
        end
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
