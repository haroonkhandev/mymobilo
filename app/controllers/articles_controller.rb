class ArticlesController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(6)
    @article_categories = ArticleCategory.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
