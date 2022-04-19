defmodule SmartGitWeb.Page.RepoDetail do
  use SmartGitWeb, :live_component
  alias SmartGit.GitRepos

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(message: nil)

    {:ok, socket}
  end

  def handle_event("add-repo", _params, socket) do
    repo = socket.assigns.repo
    SmartGit.GitRepos.create(repo)
    message = socket.assigns.message == nil && "Repo added!" || nil

    {:noreply, assign(socket, message: message)}
  end
end
