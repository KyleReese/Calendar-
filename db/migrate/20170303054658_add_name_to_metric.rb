class AddNameToMetric < ActiveRecord::Migration[5.0]
  def change
    add_column :metrics, :name, :text
  end
end
