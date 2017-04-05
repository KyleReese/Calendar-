class CreateEventEventClass < ActiveRecord::Migration[5.0]
  def change
    create_table :event_event_classes do |t|
      t.belongs_to :event_class
      t.belongs_to :event
    end
  end
end
