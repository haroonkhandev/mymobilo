class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy

  # validates :first_name, :last_name, :phone, presence: true
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

  # private

  # def format_phone_number
  #   self.phone = phone.gsub(/\D/, '') # Example: remove non-digit characters
  # end
end
