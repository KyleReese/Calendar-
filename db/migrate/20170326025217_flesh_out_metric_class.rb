class FleshOutMetricClass < ActiveRecord::Migration[5.0]
  def change
    add_column :metric_classes, :event_class_id, :integer
    add_column :metric_classes, :metric_type, :integer
    add_column :metric_classes, :name, :text
  end
end
