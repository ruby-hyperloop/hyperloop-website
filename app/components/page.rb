class Page < Hyperloop::Component

  before_mount do
    puts "about to get"
    HTTP.get('https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md') do |response|
      mutate.html response.body
    end
  end

  render(DIV) do
    SPAN { state.html }
  end
end
