class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.all.page(params[:page]).per(9)
  end

  def show
    @article_category = ArticleCategory.find(params[:id])
    @articles = @article_category.articles.page(params[:page]).per(9)
  end
end
