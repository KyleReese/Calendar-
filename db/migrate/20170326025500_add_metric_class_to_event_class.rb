class AddMetricClassToEventClass < ActiveRecord::Migration[5.0]
  def change
    add_reference :event_classes, :metric_class, foreign_key: true
  end
end
