class CreateEventClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :event_classes do |t|

      t.timestamps
    end
  end
end
