class ReactCodeMirror < Hyperloop::Component
  imports 'CodeMirror'
end


class CodeMirrorTest < Hyperloop::Component

  state code: ""

  render(DIV) do
    Sem.Container {
      H1 { "CodeMirror Test" }
      mirror
      Sem.Message(fluid: true) {
        PRE { compile || state.compile_error }
      }
    }
  end

  def compile
    begin
      compiled_code = Opal::Compiler.new(state.code).compile
    rescue Exception => e
      @time_out = after(0.1) do
        mutate.compile_error e.message
      end
    end
    compiled_code
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
