class Specification < ApplicationRecord
  belongs_to :product

  enum specification_type: {
    build_type: 0,
    frequency: 1,
    processor: 2,
    display: 3,
    memory: 4,
    camera: 5,
    video: 6,
    connectivity: 7,
    features: 8,
    battery: 9,
    box: 10
  }

  validates :specification_type, presence: true # Add validations as needed

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "product_id", "spec_attributes", "specification_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["product"]
  end

end
