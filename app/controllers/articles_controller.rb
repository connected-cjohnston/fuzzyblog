class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
  end

  def destroy
    Article.find(params[:id]).destroy
  end
end
