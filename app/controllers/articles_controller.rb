class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article_categories = ArticleCategory.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
