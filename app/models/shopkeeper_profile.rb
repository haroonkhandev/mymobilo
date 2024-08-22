class ShopkeeperProfile < ApplicationRecord
  belongs_to :user

  validates :shop_name, :description, :address, :contact_info, presence: true
end
