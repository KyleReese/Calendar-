class EventClass < ApplicationRecord
  has_many :events
  has_many :metric_classes
end
