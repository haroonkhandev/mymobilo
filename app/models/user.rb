class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  # Define searchable associations
  def self.ransackable_associations(auth_object = nil)
    %w[posts comments]
  end

  # Optionally, define searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[name email created_at updated_at reset_password_token]
  end
end