class DocsBody < Hyperloop::Component
  param :page_store
  state :needs_refresh, false

  render(DIV) do
    if params.page_store.loaded?
      edit_button if params.page_store.current_page[:allow_edit]
      BR()
      DIV(dangerously_set_inner_HTML: { __html: params.page_store.current_page[:md_converter].html })
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
            `window.open(#{params.page_store.current_page[:edit_url]}, "_blank");`
          end
        end
      }
    }
  end
end
