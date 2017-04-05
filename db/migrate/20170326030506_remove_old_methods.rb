class RemoveOldMethods < ActiveRecord::Migration[5.0]
  def change
    remove_column :event_classes, :int_metric
    remove_column :event_classes, :bool_metric
    remove_column :event_classes, :time_metric
  end
end
