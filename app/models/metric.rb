class Metric < ApplicationRecord
  METRIC_TYPES = {
    integer: "INTEGER",
    boolean: "BOOLEAN",
    time: "TIME"
  }

  validates :metric_type, inclusion: { in: METRIC_TYPES.to_a.map{|i| i[1]} }

  def self.types
    METRIC_TYPES
  end
end
