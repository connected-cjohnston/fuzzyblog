defmodule Fuzzyblog.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add(:title, :string)
      add(:body, :text)
      add(:summary, :string)
      add(:image, :string)

      timestamps()
    end
  end
end
