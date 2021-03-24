# frozen_string_literal: true

module Admin
  class ArticlesController < AdminController

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = current_user.articles.new(article_params)

      if @article.save
        redirect_to admin_articles_path
      else
        render 'new'
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.update(article_params)

      redirect_to admin_articles_path
    end

    def destroy
      Article.find(params[:id]).destroy

      redirect_to admin_articles_path
    end

    private

    def article_params
      params.require(:article).permit(:title, :body, :article_image)
    end

    def markdown_renderer
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end
end