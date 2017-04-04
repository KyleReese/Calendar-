class Metric < ApplicationRecord
  has_one :metric_class
  METRIC_TYPES = {
    integer: "integer",
    boolean: "boolean",
    time: "time"
  }

  validates :metric_type, inclusion: { in: METRIC_TYPES.values }

  def self.types
    METRIC_TYPES
  end
end
