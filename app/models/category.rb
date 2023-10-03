class Category < ApplicationRecord
	has_one_attached :picture
	has_many :sub_categories
end
