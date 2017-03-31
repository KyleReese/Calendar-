class EventClass < ApplicationRecord
  has_many :event_event_class
  has_many :events, through: :event_event_class
  has_many :metric_classes
end
