class ArticleCategoriesController < ApplicationController
  def index
    @article_categories = ArticleCategory.all
  end

  def show
    @article_category = ArticleCategory.find(params[:id])
    @articles = @article_category.articles
  end
end
