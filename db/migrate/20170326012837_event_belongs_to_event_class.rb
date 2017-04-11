class EventBelongsToEventClass < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_class_id, :integer
  end
end
