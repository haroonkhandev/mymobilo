class Category < ApplicationRecord
	has_one_attached :picture
	has_many :products
	# has_many :comments

	def self.ransackable_associations(auth_object = nil)
		["picture_attachment", "picture_blob", "products"]
	end
	def self.ransackable_attributes(auth_object = nil)
		["created_at", "id", "name", "updated_at"]
	end
end
