defmodule SmartGit.GithubApi.GetRepos do
  use Tesla

  @middleware [
    {Tesla.Middleware.BaseUrl, "https://api.github.com"},
    Tesla.Middleware.JSON
  ]

  def get_repos(language, page, per_page) do
    @middleware
    |> Tesla.client()
    |> get("/search/repositories",
      query: [
        q: "language:#{language}",
        sort: "stars",
        order: "desc",
        page: page,
        per_page: per_page
      ]
    )
    |> handle_result()
  end

  defp handle_result({:ok, %{status: 403}}), do: {:error, :exceeded_limit}
  defp handle_result({:ok, %{status: 404}}), do: {:error, :not_found}

  defp handle_result({:ok, %{body: %{"items" => items}}}) do
    items
    |> Enum.map(fn item ->
      %{
        "id" => id,
        "owner" => %{"avatar_url" => avatar_url},
        "full_name" => full_name,
        "watchers_count" => watchers_count,
        "forks_count" => forks_count,
        "description" => description,
        "language" => language,
        "name" => name,
        "open_issues_count" => open_issues_count,
        "html_url" => url
      } = item

      %{
        avatar_url: avatar_url,
        full_name: full_name,
        git_id: id,
        watchers_count: watchers_count,
        forks: forks_count,
        description: description,
        name: name,
        open_issues: open_issues_count,
        language: language,
        url: url
      }
    end)
  end

  # defp mock_repo do
  #   %{
  #     avatar_url: "https://avatars.githubusercontent.com/u/1481354?s=200&v=4",
  #     full_name: "Elixir Language",
  #     git_id: :rand.uniform(10_000),
  #     watchers_count: 500,
  #     forks: 500,
  #     description: "Lorem ipsum",
  #     name: "Elixir",
  #     open_issues: 10,
  #     language: "Elixir"
  #   }
  # end
end
