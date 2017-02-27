class FleshOutMetric < ActiveRecord::Migration[5.0]
  def change
    add_column :metrics, :type, :string
    add_column :metrics, :int_val, :integer
    add_column :metrics, :boolean_val, :boolean
    add_column :metrics, :time_val, :time
  end
end
