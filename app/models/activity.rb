class Activity < ApplicationRecord
  belongs_to :shopkeeper_shop

  validates :action, :details, presence: true

  def action_icon
    case action.downcase
    when /create/, /added/ # Using regex to match broader cases
      'check'
    when /update/, /edited/
      'edit'
    when /destroy/, /deleted/, /remove/
      'trash-2'
    else
      'alert-circle'
    end
  end
end
