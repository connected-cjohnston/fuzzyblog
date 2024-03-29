defmodule Fuzzyblog.ArticlesTest do
  use Fuzzyblog.DataCase

  alias Fuzzyblog.Articles

  describe "articles" do
    alias Fuzzyblog.Articles.Article

    import Fuzzyblog.ArticlesFixtures

    @invalid_attrs %{body: nil, image: nil, summary: nil, title: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Articles.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Articles.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      valid_attrs = %{
        body: "some body",
        image: "some image",
        summary: "some summary",
        title: "some title"
      }

      assert {:ok, %Article{} = article} = Articles.create_article(valid_attrs)
      assert article.body == "some body"
      assert article.image == "some image"
      assert article.summary == "some summary"
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()

      update_attrs = %{
        body: "some updated body",
        image: "some updated image",
        summary: "some updated summary",
        title: "some updated title"
      }

      assert {:ok, %Article{} = article} = Articles.update_article(article, update_attrs)
      assert article.body == "some updated body"
      assert article.image == "some updated image"
      assert article.summary == "some updated summary"
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_article(article, @invalid_attrs)
      assert article == Articles.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Articles.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Articles.change_article(article)
    end
  end
end
