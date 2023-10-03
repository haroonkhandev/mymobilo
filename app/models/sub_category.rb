class SubCategory < ApplicationRecord
  has_one_attached :picture
  has_many :products
  belongs_to :category
end
