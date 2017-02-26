class AddEventToEventClass < ActiveRecord::Migration[5.0]
  def change
    add_reference :event_classes, :event, foreign_key: true
  end
end
