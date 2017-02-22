#Starting a very basic Event class...
class Event < ActiveRecord::Base
  belongs_to :EventGroup
end
