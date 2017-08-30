class PageBody < Hyperloop::Component
  param :page
  state needs_refresh: false

  render(DIV) do
    Sem.Container(style: { marginTop: '2em', paddingRight: '28px' }) do
      # H1 {  params.page[:repo].to_s }
      edit_button if params.page[:allow_edit]
      DIV(dangerously_set_inner_HTML: { __html: params.page[:md_converter].html })
      # Sem.Rail(internal: true, position: :right) {
        # edit_button if params.page[:allow_edit]
      # } if params.page[:allow_edit]
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
            `window.open(#{params.page[:edit_url]}, "_blank");`
          end
        end
      }
    }
  end
end
