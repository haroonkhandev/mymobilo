class Product < ApplicationRecord
	has_one :specification
	# has_one :build
	# has_one :frequency
	# has_one :processor
	# has_one :display
	# has_one :memory
	# has_one :camera
	# has_one :connectivity
	# has_one :feature
	# has_one :battery
	# has_one :box
	belongs_to :sub_category
end
