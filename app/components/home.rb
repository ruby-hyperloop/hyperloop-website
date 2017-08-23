module Components
  class Home < Hyperloop::Component
    render do
      # Sem.Container(style: { marginTop: '2em' }) do
        Sem.Grid do
          Sem.GridRow(columns: 3) do
            Sem.GridColumn(width: 4) do
              side_nav
            end
            Sem.GridColumn(width: 12) do
              body
            end
          end
        end
      # end
    end

    def side_nav
      Sem.Container(style: { marginTop: '2em', paddingLeft: '28px' }) do
          200.times { SPAN { "side " } }
        end
    end

    def body
      Sem.Container(style: { marginTop: '2em', paddingRight: '28px' }) do
        3000.times { SPAN { "body " } }
      end
    end
  end

end
