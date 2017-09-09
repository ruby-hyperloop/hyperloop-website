class SectionStore < Hyperloop::Store

  state loaded: false

  def initialize pages
    puts "SectionStore is starting now"
    @pages = pages
    load_and_convert_pages
    mutate.current_page @pages[0]
  end

  def pages
    @pages
  end

  def loaded?
    state.loaded
  end

  def current_page
    state.current_page
  end

  def current_anchor
    state.current_anchor
  end

  def set_current_page page
    mutate.current_page page
  end

  def set_current_anchor anchor
    mutate.current_anchor anchor
  end

  def load_and_convert_pages
    @promises = 0

    @pages.each do |page|
      get(page)
    end
  end

  def get page
    @promises += 1
    HTTP.get( raw_url(page) ) do |response|
      if response.ok?
        converted = MdConverter.new(response.body)
        page[:headings] = converted.headings
        page[:code_blocks] = converted.code_blocks
        page[:html] = converted.html
        page[:edit_url] = edit_url page
      else
        alert "Unable to get #{raw_url(page)} from Github"
      end
      @promises -= 1
      mutate.loaded true if @promises == 0
    end
  end

  def raw_url page
    "https://raw.githubusercontent.com/ruby-hyperloop/#{page[:repo]}/master/#{page[:file]}"
  end

  def edit_url page
    "https://github.com/ruby-hyperloop/#{page[:repo]}/edit/master/#{page[:file]}"
  end
end
