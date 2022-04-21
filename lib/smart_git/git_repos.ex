defmodule SmartGit.GitRepos do
  import Ecto.Query
  alias SmartGit.Repo
  alias SmartGit.GitRepos.GitRepo

  def create(repo) do
    %GitRepo{}
    |> GitRepo.changeset(repo)
    |> Repo.insert()
  end

  def get_all, do: Repo.all(GitRepo)

  def get_all_repos_id do
    GitRepo
    |> select([g], g.git_id)
    |> Repo.all()
  end

  def get_by_git_id(git_id), do: Repo.get_by(GitRepo, git_id: git_id)
end
