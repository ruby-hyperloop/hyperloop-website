class PageBody < Hyperloop::Component

  param :section

  before_mount do
    mutate.needs_refresh false
  end

  after_update do
    if !NavigationStore.state.slug.empty?
      # if !(Element["##{NavigationStore.state.slug}"].nil?)
        #puts "ELEMENT: #{Element["##{NavigationStore.state.slug}"].offset().nil?}"
        anchorchapter_position = Element["##{NavigationStore.state.slug}"].offset().top
        #puts "Position: #{anchorchapter_position}"
        #puts "BODY update"
        Element['html, body'].animate({
              scrollTop: anchorchapter_position
            }, 500)
      # end
    end
  end

  render(DIV) do
    if SiteStore.sections[params.section].loaded?
      edit_button if SiteStore.sections[params.section].current_page[:allow_edit]
      Sem.Divider(hidden: true)
      DIV(dangerously_set_inner_HTML: { __html: SiteStore.sections[params.section].current_page[:html] })
      convert_runable_code_blocks
    end
  end

  def convert_runable_code_blocks
    Element.find('code.lang-ruby-runable').each do |mount_point|
      code = mount_point.text
      React.render(React.create_element(CodeMirror, {code: code} ), mount_point.parent)
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
            `window.open(#{SiteStore.sections[params.section].current_page[:edit_url]}, "_blank");`
          end
        end
      }
    }
  end

end
