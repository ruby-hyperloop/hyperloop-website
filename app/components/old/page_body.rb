class PageBody < Hyperloop::Component
  param :page
  state needs_refresh: false

  after_mount do
    # convert_runable_code_blocks
    # puts "after mount"
  end

  render(DIV) do
    # puts "rendering PageBody"
    Sem.Container(style: { marginTop: '2em', paddingRight: '28px' }) do
      # edit_button if params.page[:allow_edit]
      DIV(dangerously_set_inner_HTML: { __html: params.page[:md_converter].html })
    end
    convert_runable_code_blocks
    # puts "navifate to #{PageStore.current_anchor}"
    # navigate_to PageStore.current_anchor if PageStore.current_anchor
  end

  def convert_runable_code_blocks
    # force_update!
    # puts "convert_runable_code_blocks"
    Element.find('code.lang-ruby-runable').each do |mount_point|
      code = mount_point.text
      # puts code
      React.render(React.create_element(CodeMirror, {code: code} ), mount_point.parent)
     end
  end

  def navigate_to anchor
    puts anchor
    `document.getElementById(#{anchor}).scrollIntoView(true);`
  end


  # def edit_button
  #   Sem.Grid(textAlign: :right) {
  #     Sem.GridColumn {
  #       if state.needs_refresh
  #         Sem.Message(positive: true) {
  #           Sem.MessageHeader { "Thank you!" }
  #           P { "PRs are always welcome." }
  #         }
  #       else
  #         Sem.Button(icon: :github, circular: true, label: "Improve this page") {
  #
  #         }.on(:click) do
  #           mutate.needs_refresh true
  #           `window.open(#{params.page[:edit_url]}, "_blank");`
  #         end
  #       end
  #     }
  #   }
  # end
end
