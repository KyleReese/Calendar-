class AddEventName < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :name, :text
  end
end
