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
    battery: 9
  }

  validates :specification_type, presence: true # Add validations as needed

  store_accessor :spec_attributes, :material, :dimensions, :weight, :frequency_value, :processor_type, :display_size, :memory_size, :camera_resolution, :video_resolution, :connectivity_type, :feature_list, :battery_capacity
end
