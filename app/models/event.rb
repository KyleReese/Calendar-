class Event < ApplicationRecord
  has_many :event_event_class
  has_many :event_classes, through: :event_event_class
  has_many :metrics
end
