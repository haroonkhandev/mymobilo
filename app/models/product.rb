class Product < ApplicationRecord
	has_many_attached :pictures
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
	belongs_to :category

	scope :upcoming_products, -> { where('release_date > ?', Date.today) }

	scope :latest, lambda{ where(['release_date > ?', 30.days.ago]) }

	def is_upcoming?
    release_date > Date.today
  end

  def is_latest?
		release_date < Date.today - 30.days
  end

end
