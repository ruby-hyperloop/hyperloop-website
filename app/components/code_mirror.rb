class ReactCodeMirror < Hyperloop::Component
  imports 'CodeMirror'
end


class CodeMirrorTest < Hyperloop::Component

  state code: ""

  before_mount do
    code =
"class MyComp < Hyperloop::Component
  render do
    H1 { 'Hello world' }
  end
end"
  # code = "puts 'hello'"
    mutate.code code
  end

  render(DIV) do
    Sem.Container {
      H1 { "CodeMirror Test" }
      mirror

      if compile && evaluate
        Sem.Message {
          render_component
        }

      else
        Sem.Message(negative: true) {
          PRE { state.compile_error }
        }
      end
    }
  end

  def compile
    begin
      ret = true
      @compiled_code = Opal::Compiler.new(state.code).compile
    rescue Exception => e
      message = e.message
      mutate.compile_error message.gsub 'An error occurred while compiling: (file)', 'Oops...'
      ret = false
    end
    ret
  end

  def evaluate
    begin
      ret = true
      `eval(#{@compiled_code})`
      rescue Exception => e
        mutate.compile_error "Oops... \n\n #{e.message}"
        ret = false
    end
    ret
  end

  def render_component
    puts "SUCCESS LETS RENDER"
    # `ReactDOM.unmountComponentAtNode(document.getElementById("result"));`
    # render{ MyComp() }
    MyComp()
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
