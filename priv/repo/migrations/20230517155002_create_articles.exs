defmodule Fuzzyblog.Repo.Migrations.CreateArticles do
  @moduledoc """
  Migration for Articles table
  """
  use Ecto.Migration

  def change do
    create table(:articles) do
      add(:title, :string)
      add(:body, :string)
      add(:summer, :string)
      timestamps()
    end
  end
end
