defmodule FuzzyblogWeb.ArticlesController do
  use FuzzyblogWeb, :controller

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
    render(conn, :new)
  end
end
