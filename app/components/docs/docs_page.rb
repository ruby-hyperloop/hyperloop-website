class DocsPage < Hyperloop::Router::Component

  before_mount do
    pages = [
      # { repo: 'hyperloop-website', file: 'dist/dummy_DOCS.md',  allow_edit: true },
      { repo: 'hyper-react',     file: 'DOCS.md',  allow_edit: true },
      { repo: 'hyper-store',     file: 'DOCS.md',  allow_edit: true },
      { repo: 'hyper-router',    file: 'DOCS.md',  allow_edit: true },
      { repo: 'hyper-mesh',      file: 'DOCS.md',  allow_edit: true },
      { repo: 'hyper-operation', file: 'DOCS.md',  allow_edit: true },
      { repo: 'hyper-operation', file: 'DOCS-POLICIES.md',  allow_edit: true }
    ]

    @@page_store ||= PageStore.new(pages)
  end

  render(DIV) do

    sidebar = DocsSidebar(page_store: @@page_store).as_node
    body = DocsBody(page_store: @@page_store).as_node

    PageLayout(sidebar_component: sidebar, body_component: body, loaded: @@page_store.loaded?)
  end
end
