class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    markdown_renderer
  end

  def show
    @article = Article.find(params[:id])
    markdown_renderer
  end

  private

  def markdown_renderer
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
