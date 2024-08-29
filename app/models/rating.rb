class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :shopkeeper_shop

  validates :rating, presence: true, inclusion: { in: 1..5 }
end
