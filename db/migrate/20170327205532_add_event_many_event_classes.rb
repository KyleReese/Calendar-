class AddEventManyEventClasses < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :event_class, foreign_key: true
  end
end
