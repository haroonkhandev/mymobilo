class AddIndexToActivitiesCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :activities, :created_at
  end
end
