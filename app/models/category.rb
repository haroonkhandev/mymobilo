class Category < ApplicationRecord
  # Mounts the uploader to handle image uploads
  mount_uploader :picture, ImageUploader

  has_many :products, dependent: :destroy

  # Ransackable associations and attributes
  def self.ransackable_associations(auth_object = nil)
    ["products"]  # Removed unnecessary ActiveStorage-related associations
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "picture"]  # Added picture to searchable attributes
  end
end