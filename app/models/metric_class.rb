class MetricClass < ApplicationRecord
  belongs_to :event_class
  has_many :metrics
  enum metric_type: [ :integer, :boolean, :time ]

  def self.types
    {
      integer: "integer",
      boolean: "boolean",
      time: "time"
    }
  end
end
