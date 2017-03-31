class MetricClass < ApplicationRecord
  belongs_to :event_class
  enum metric_type: [ :integer, :boolean, :time ]
end
