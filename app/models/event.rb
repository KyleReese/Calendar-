class Event < ApplicationRecord
  belongs_to :EventClass
  has_many :metrics
end
