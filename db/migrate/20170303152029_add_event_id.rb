class AddEventId < ActiveRecord::Migration[5.0]
  def change
    add_column :metrics, :event_id, :integer
  end
end
