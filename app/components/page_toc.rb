class PageToc < Hyperloop::Component
  param :page

  render(DIV) do
    H3 { LI { params.page[:repo].to_s } }
    UL {
      params.page[:md_converter].headings.each do |heading|
        LI { heading[:text] }
      end if params.page[:md_converter]
    }
  end
end
