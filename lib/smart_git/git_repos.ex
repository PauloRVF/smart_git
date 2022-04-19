defmodule SmartGit.GitRepos do
  alias SmartGit.Repo
  alias SmartGit.GitRepos.GitRepo

  def create(repo) do
    %GitRepo{}
    |> GitRepo.changeset(repo)
    |> Repo.insert()
  end

  def get_all(), do: Repo.all(GitRepo)
end
