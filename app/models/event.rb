class Event < ApplicationRecord
  has_many :event_event_class
  has_many :event_classes, through: :event_event_class
  has_many :metric_classes, -> {distinct}, through: :event_classes
  has_many :metrics
end
