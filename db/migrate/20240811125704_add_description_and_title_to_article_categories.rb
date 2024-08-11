class AddDescriptionAndTitleToArticleCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :article_categories, :description, :string
    add_column :article_categories, :title, :string
  end
end
