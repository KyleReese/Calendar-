class RemoveEventClassId < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_class_id
  end
end
