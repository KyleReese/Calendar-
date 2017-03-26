class Event < ApplicationRecord
  has_many :metrics
  belongs_to :event_class
  # has_and_belongs_to_many :event_class
end
