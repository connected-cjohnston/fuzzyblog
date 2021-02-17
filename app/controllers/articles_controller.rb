class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def show
    @article = Article.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    Article.find(params[:id]).destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :article_image)
  end
end
