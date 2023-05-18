defmodule Fuzzyblog.ArticlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fuzzyblog.Articles` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        body: "some body",
        image: "some image",
        summary: "some summary",
        title: "some title"
      })
      |> Fuzzyblog.Articles.create_article()

    article
  end
end
