defmodule SmartGitWeb.ShowRepoLive do
  use SmartGitWeb, :live_view
  alias SmartGit.GitRepos

  def mount(%{"id" => git_id}, _, socket) do
    IO.inspect(git_id, label: "receiving")

    repo = GitRepos.get_by_git_id(git_id)
    socket = assign(socket, repo: repo)

    {:ok, socket}
  end
end
