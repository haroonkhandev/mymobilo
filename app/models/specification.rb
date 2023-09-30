class Specification < ApplicationRecord
  belongs_to :product
  has_one :build
  has_one :frequency
  has_one :processor
  has_one :display
  has_one :memory
  has_one :camera
  has_one :connectivity
  has_one :feature
  has_one :battery
  has_one :box
end
