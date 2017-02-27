class ChangeMetricType < ActiveRecord::Migration[5.0]
  def change
    add_column :metrics, :metric_type, :string
    remove_column :metrics, :type
  end
end
