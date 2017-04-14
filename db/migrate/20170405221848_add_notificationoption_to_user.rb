class AddNotificationoptionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notificationoption, :boolean, :default => true
  end
end
