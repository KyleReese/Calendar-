class MetricClass < ApplicationRecord
  belongs_to :event_class
  enum metric_type: [ :integer, :boolean, :time ]

  def self.types
    {
      integer: "integer",
      boolean: "boolean",
      time: "time"
    }
  end
end
