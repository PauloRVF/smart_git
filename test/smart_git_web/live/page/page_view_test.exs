defmodule SmartGitWeb.Page.PageLiveTest do
  use SmartGitWeb.ConnCase
  import Phoenix.LiveViewTest

  test "load page elements", %{conn: conn} do
    assert {:ok, view, _html} = live(conn, Routes.page_path(conn, :index))

    assert has_element?(view, "[data-role=btn-language-select][data-id=elixir]", "Elixir")
    assert has_element?(view, "[data-role=btn-language-select][data-id=javascript]", "Javascript")
    assert has_element?(view, "[data-role=btn-language-select][data-id=clojure]", "Clojure")
    assert has_element?(view, "[data-role=btn-language-select][data-id=elm]", "Elm")
    assert has_element?(view, "[data-role=btn-language-select][data-id=rust]", "Rust")
  end
end
