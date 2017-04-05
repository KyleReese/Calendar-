class AddMetricMetricClassId < ActiveRecord::Migration[5.0]
  def change
    add_column :metrics, :metric_class_id, :integer
  end
end
