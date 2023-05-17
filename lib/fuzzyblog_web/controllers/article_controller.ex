defmodule FuzzyblogWeb.ArticleController do
  use FuzzyblogWeb, :controller

  # GET "/articles
  def index(conn, _params) do
    render(conn, :index)
  end
end
