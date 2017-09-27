class PageBody < Hyperloop::Component

  param :section_store

  before_mount do
    mutate.needs_refresh false
  end

  render(DIV) do
    if params.section_store.loaded?
      edit_button if params.section_store.current_page[:allow_edit]
      Sem.Divider(hidden: true)
      DIV(dangerously_set_inner_HTML: { __html: params.section_store.current_page[:html] })
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
            `window.open(#{params.section_store.current_page[:edit_url]}, "_blank");`
          end
        end
      }
    }
  end

end
