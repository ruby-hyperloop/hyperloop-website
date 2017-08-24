class ReactCodeMirror < Hyperloop::Component
  imports 'CodeMirror'
end


class CodeMirrorTest < Hyperloop::Component

  state code: ""

  render(DIV) do
    Sem.Container {
      H1 { "CodeMirror Test" }
      Sem.Grid(columns: 2) {
        Sem.GridRow {
          Sem.GridColumn {
            mirror
          }
          Sem.GridColumn {
            P {"And this is where it will be evaluated."}
            PRE {
              state.code
            }
          }

        }
        Sem.GridRow {
          Sem.GridColumn {
            Sem.Message(fluid: true) {
              "Compile results:"
            }
          }
        }
      }

    }
  end

  def mirror
    options = {
      lineNumbers: false,
      mode: :ruby,
      theme: 'one-dark',
      indentUnit: 2,
      matchBrackets: true
    }
    ReactCodeMirror(options: options.to_n, value: state.code, onChange: lambda { |value| mutate.code value })
  end

end
