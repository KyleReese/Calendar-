class AddEventClassMetrics < ActiveRecord::Migration[5.0]
  def change
    add_column :event_classes, :metric_types, :text, array:true, default: []
  end
end
