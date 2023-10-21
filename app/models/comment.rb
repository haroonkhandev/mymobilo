class Comment < ApplicationRecord
  paginates_per 4
  belongs_to :product
  belongs_to :user
end
