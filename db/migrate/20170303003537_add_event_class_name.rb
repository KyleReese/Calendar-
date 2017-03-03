class AddEventClassName < ActiveRecord::Migration[5.0]
  def change
    add_column :event_classes, :name, :text 
  end
end
