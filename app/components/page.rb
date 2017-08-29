# Document.ready? do
#   puts "doc ready afm"
#   Element.find('code.lang-ruby-runable').each do |mount_point|
#     code = mount_point.text
#     puts code
#     React.render(React.create_element(CodeMirror, {code: code} ), mount_point.parent)
#    end
# end

class Page < Hyperloop::Component
  param :repo
  param :file
  param allow_edit: true

  state search: ""
  state needs_refresh: false

  # https://github.com/ruby-hyperloop/hyperloop-website/blob/master/dist/DOCS.md

  # raw:  https://raw.githubusercontent.com/ruby-hyperloop/hyperloop-website/master/dist/DOCS.md
  # edit: https://github.com/ruby-hyperloop/hyperloop-website/edit/master/dist/DOCS.md

  before_mount do
    puts "before mount"
    @raw_url = "https://raw.githubusercontent.com/ruby-hyperloop/#{params.repo.to_s}/master/#{params.file.to_s}"
    @edit_url = "https://github.com/ruby-hyperloop/#{params.repo}/edit/master/#{params.file}"
    get_page
    # afm
  end

  def afm
  #   puts "about to find elements"
  #  Element.find('code.lang-ruby-runable').each do |mount_point|
  #    code = mount_point.text
  #    puts code
  #    React.render(React.create_element(CodeMirror, {code: code} ), mount_point.parent)
  #   end
  end

  render(DIV) do

    Sem.Grid do
      Sem.GridRow(columns: 2) do
        Sem.GridColumn(width: 4) do
          BUTTON {"Re-mount"}.on(:click) do
            afm
          end
          side_nav
        end
        Sem.GridColumn(width: 12) do
          body
        end
      end
    end
  end

  def get_page
    puts "het page"
    HTTP.get(@raw_url) do |response|
      puts "post promise"
      md = MdConverter.new(response.body)
      mutate.html md.html
      mutate.code_blocks md.code_blocks
      mutate.headings md.headings
      runable
    end
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
