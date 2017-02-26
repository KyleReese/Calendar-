class AddMetricToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :metric, foreign_key: true
  end
end
