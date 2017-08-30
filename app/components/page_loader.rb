class PageLoader < Hyperloop::Component

  after_mount do
    bfm
  end

  def bfm
    @pages = [
      { repo: 'hyper-store', file: 'DOCS.md', allow_edit: true },
      { repo: 'hyper-mesh', file: 'DOCS.md', allow_edit: true },
      { repo: 'hyper-react', file: 'DOCS.md', allow_edit: true }
    ]
    load_and_convert_pages
  end

  def load_and_convert_pages
    @pages.each do |page|
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

  render(DIV) do
    BUTTON { "Before Mount" }.on(:click) { bfm }
    BUTTON { "Force Update" }.on(:click) { force_update! }
    Sem.Divider()

    Sem.Grid do
      Sem.GridRow(columns: 2) do
        Sem.GridColumn(width: 4) do
          side_nav
        end
        Sem.GridColumn(width: 12) do
          body
        end
      end
    end
  end

  def side_nav
    # Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      Sticky {
        @pages.each do |page|
          PageToc(page: page)
        end if @pages
      }
    # }
  end

  def body
    Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) {
      @pages.each do |page|
        PageBody(page: page) if page[:md_converter]
        Sem.Divider()
      end if @pages
    }
  end

end
