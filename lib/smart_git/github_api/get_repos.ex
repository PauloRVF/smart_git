defmodule SmartGit.GithubApi.GetRepos do
  def get_repos do
    for _ <- 1..10 do
      mock_repo()
    end
  end

  defp mock_repo do
    %{
      avatar_url: "https://avatars.githubusercontent.com/u/1481354?s=200&v=4",
      full_name: "Elixir Language",
      git_id: :rand.uniform(10_000),
      watchers_count: 500,
      forks: 500,
      description: "Lorem ipsum",
      name: "Elixir",
      open_issues: 10,
      language: "Elixir"
    }
  end
end
