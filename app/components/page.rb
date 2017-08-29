class PageLoader < Hyperloop::Component

  after_mount do
    bfm
  end

  def bfm
    mutate.pages [
      { repo: 'hyper-store', file: 'DOCS.md', allow_edit: true },
      { repo: 'hyper-mesh', file: 'DOCS.md', allow_edit: true },
      { repo: 'hyper-react', file: 'DOCS.md', allow_edit: true }
    ]
    load_and_convert_pages
  end

  def load_and_convert_pages
    state.pages.each do |page|
      HTTP.get( raw_url(page) ) do |response|
        puts "response"
        page[:md_converter] = MdConverter.new(response.body)
      end
    end
  end

  def raw_url page
    "https://raw.githubusercontent.com/ruby-hyperloop/#{page[:repo]}/master/#{page[:file]}"
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
    state.pages.each do |page|
      H3 { LI {page[:repo].to_s} }
      UL {
        page[:md_converter].headings.each do |heading|
          LI { heading[:text] }
        end if page[:md_converter]
      }
    end #if state.pages
  end

  def body
    P { "body" }
  end

end

class Page < Hyperloop::Component
  param :repo
  param :file
  param allow_edit: true

  state search: ""
  state needs_refresh: false

  before_mount do
    puts "before mount"
    # @raw_url = "https://raw.githubusercontent.com/ruby-hyperloop/#{params.repo.to_s}/master/#{params.file.to_s}"
    @edit_url = "https://github.com/ruby-hyperloop/#{params.repo}/edit/master/#{params.file}"
    get_page
  end

  render(DIV) do

    # Sem.Grid do
    #   Sem.GridRow(columns: 2) do
    #     Sem.GridColumn(width: 4) do
    #       side_nav
    #     end
    #     Sem.GridColumn(width: 12) do
    #       body
    #     end
    #   end
    # end
  end

  def get_page
    # puts "get page"
    # HTTP.get(@raw_url) do |response|
    #   puts "post promise"
    #   # md = MdConverter.new(response.body)
    #   mutate.html md.html
    #   mutate.code_blocks md.code_blocks
    #   mutate.headings md.headings
    #   runable
    # end
  end

  def runable
    puts "runable"
    force_update!
    Element.find('code.lang-ruby-runable').each do |mount_point|
      code = mount_point.text
      puts code
      React.render(React.create_element(CodeMirror, {code: code} ), mount_point.parent)
     end
  end

  def search_input
    Sem.Input(placeholder: 'Search', fluid: true).on(:change) do |e|
      mutate.search e.target.value
    end
  end

  def side_nav
    Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) do
      Sticky {
        search_input
        H4 {"Sections"}
        sections_results
        H4 {"Code"} unless state.search == ""
        code_results
      }
      end
  end

  def sections_results
    state.headings.each do |heading|
      if state.search
        P { heading[:text] } if heading[:text].downcase.include?(state.search.downcase)
      else
        P { heading[:text] }
      end
    end if state.headings
  end

  def code_results
    state.code_blocks.each do |code|
      if state.search != "" && code[:code].downcase.include?(state.search.downcase)
        PRE(class: 'hljs') {
          DIV(dangerously_set_inner_HTML: { __html: code[:html] })
        }
      end
    end  if state.code_blocks && state.search
  end

  def body
    Sem.Container(style: { marginTop: '2em', paddingRight: '28px' }) do
      DIV(dangerously_set_inner_HTML: { __html: state.html })
      Sem.Rail(internal: true, position: :right) {
        edit_button
      } if params.allow_edit
    end
  end

  def edit_button
    Sem.Grid(textAlign: :right) {
      Sem.GridColumn {
        if state.needs_refresh
          Sem.Message(positive: true) {
            Sem.MessageHeader { "Thank you!" }
            P { "PRs are always welcome." }
          }
        else
          Sem.Button(icon: :github, circular: true, label: "Improve this page") {

          }.on(:click) do
            mutate.needs_refresh true
            `window.open(#{@edit_url}, "_blank");`
          end
        end
      }
    }
  end
end
