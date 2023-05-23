defmodule FuzzyblogWeb.ArticlesController do
  @moduledoc """
  ReST functions for Article resource
  """
  use FuzzyblogWeb, :controller

  alias Fuzzyblog.Articles.Article

  @doc """
  # GET /articles
  """
  def index(conn, _params) do
    articles = Fuzzyblog.Articles.list_articles()
    render(conn, :index, articles: articles)
  end

  @doc """
  GET /articles/:id
  """
  def show(conn, %{"id" => id}) do
    article = Fuzzyblog.Articles.get_article!(id)
    render(conn, :show, article: article)
  end

  @doc """
  GET /articles/new
  """
  def new(conn, _params) do
    changeset = Article.changeset(%Article{})
    render(conn, :new, changeset: changeset)
  end

  @doc """
  POST /articles/
  """
  def create(conn, %{"article" => %{"body" => body, "summary" => summary, "title" => title}}) do
    article = %{title: title, summary: summary, body: body}

    case Fuzzyblog.Articles.create_article(article) do
      {:ok, _new_article} ->
        conn
        |> put_flash(:info, "Article successfully created")
        |> redirect(to: ~p"/articles")

      {:error, changeset} ->
        IO.puts(inspect(changeset))

        conn
        |> put_flash(
          :error,
          "Something went wrong, please try again\n#{inspect(changeset.errors)}"
        )
        |> render(:new, changeset: changeset)
    end
  end
end
