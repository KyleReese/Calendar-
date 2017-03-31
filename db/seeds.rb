# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Metric.create(metric_type: 'INTEGER')

require 'factory_girl_rails'

10.times do
  # byebug
  FactoryGirl.create :event_class_with_events
  # FactoryGirl.create :int_metric

  # FactoryGirl.create :int_metric
  # FactoryGirl.create :int_metric
end
