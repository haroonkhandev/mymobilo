class AddimageToArticleCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :article_categories, :image, :string
    add_column :articles, :images, :string
  end
end
