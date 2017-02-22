class AddEventIdToMetric < ActiveRecord::Migration[5.0]
  def chang
    add_column :metrics, :event_class_id, :string
  end
end
