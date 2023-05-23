defmodule Fuzzyblog.Articles.Article do
  @moduledoc """
  Schema file for Article model
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field(:body, :string)
    field(:image, :string)
    field(:summary, :string)
    field(:title, :string)

    timestamps()
  end

  @doc false
  def changeset(article, attrs \\ %{}) do
    article
    |> cast(attrs, [:title, :body, :summary, :image])
    |> validate_required([:title, :body, :summary, :image])
  end
end
