class Event < ApplicationRecord
  has_many :metrics
  has_and_belongs_to_many :event_class
end
