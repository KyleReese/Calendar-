class Event < ApplicationRecord
  belongs_to :event_class
  has_many :metrics
end
