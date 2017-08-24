module Components
  class Home < Hyperloop::Component

    state repo: nil

    render(DIV) do
      BUTTON { "Edit: HyperModel dummy DOCS on website (edit ok)" }.on(:click) do
        mutate.repo 'hyperloop-website'
        mutate.file 'dist/dummy_DOCS.md'
        mutate.edit true
        mutate.key 1
      end

      BUTTON { "Github: HyperComponent DOCS (no edit)" }.on(:click) do
        # mutate.url 'https://raw.githubusercontent.com/ruby-hyperloop/hyper-react/master/DOCS.md'
        mutate.repo 'hyper-react'
        mutate.file 'DOCS.md'
        mutate.edit false
        mutate.key 2
      end

      Sem.Divider()
      Page(repo: state.repo, file: state.file, key: state.key, allow_edit: state.edit) unless state.repo.nil?
    end
  end
end
