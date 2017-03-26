class MetricClass < ApplicationRecord
  enum metric_type: [ :integer, :boolean, :time ]
end
