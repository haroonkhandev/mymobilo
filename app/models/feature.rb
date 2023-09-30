class Feature < ApplicationRecord
	belongs_to :product
	belongs_to :specification
end
