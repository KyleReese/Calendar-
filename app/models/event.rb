class Event < ApplicationRecord
  has_many :metrics
  belongs_to :event_class
end
