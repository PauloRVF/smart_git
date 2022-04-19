defmodule SmartGitWeb.RepoLive do
  use SmartGitWeb, :live_view
  alias SmartGitWeb.Shared.RepoDetail

  def mount(_, _, socket) do
    repos = SmartGit.GitRepos.get_all()
    socket = assign(socket, repos: repos)

    {:ok, socket}
  end

end
