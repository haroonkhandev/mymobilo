class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :shopkeeper_profiles, dependent: :destroy  # Ensure this matches your model name
  has_many :shop_products
  has_many :products, through: :shop_products
  # Ensure role is either 'user' or 'shopkeeper'
  validates :role, inclusion: { in: %w[user shopkeeper] }

  before_validation :set_default_role, on: :create

  # Ensure terms acceptance
  validates :terms, acceptance: true

  # Define searchable associations
  def self.ransackable_associations(auth_object = nil)
    %w[posts comments]
  end

  # Optionally, define searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[name email created_at updated_at reset_password_token first_name last_name phone birthday address_line_1 address_line_2 state country city]
  end

  # Optional formatting or data processing
  # before_save :format_phone_number

  def set_default_role
    self.role ||= 'user'
  end

  # Role checking methods
  public

  def user?
    role == 'user'
  end

  def shopkeeper?
    role == 'shopkeeper'
  end

  # def format_phone_number
  #   self.phone = phone.gsub(/\D/, '') # Example: remove non-digit characters
  # end
end
