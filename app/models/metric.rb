class Metric < ApplicationRecord
  belongs_to :Event
  METRIC_TYPES = {
    integer: "INTEGER",
    boolean: "BOOLEAN",
    time: "TIME"
  }

  validates :type, inclusion: METRIC_TYPES

  def types
    METRIC_TYPES
  end
end
