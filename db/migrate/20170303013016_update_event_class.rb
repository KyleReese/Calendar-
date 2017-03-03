class UpdateEventClass < ActiveRecord::Migration[5.0]
  def change
    add_column :event_classes, :int_metric, :boolean, default: false
    add_column :event_classes, :bool_metric, :boolean, default: false
    add_column :event_classes, :time_metric, :boolean, default: false
    remove_column :event_classes, :metric_types
  end
end
