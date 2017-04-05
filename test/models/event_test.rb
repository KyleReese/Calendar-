require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "initialize_metrics should create metrics" do
    event = FactoryGirl.create(:event_class_with_events).events.first
    assert event.metrics.count == 0
    event.initialize_metrics
    assert event.metrics.count == 5
  end

  test "initialize_metrics should not recreate metrics" do
    event = FactoryGirl.create(:event_class_with_events).events.first
    event.initialize_metrics
    assert event.metrics.count == 5

    event.initialize_metrics
    assert event.metrics.count == 5
  end

  # test "update_metrics should update metrics" do
  #   params = {
  #     event: {
  #       metrics: {
  #         "1": {int_val: 12},
  #         # "2": {boolean_val: "1"} TODO
  #       }
  #     }
  #   }
  #   event = FactoryGirl.create(:event_class_with_events).events.first
  #   event.initialize_metrics
  # end
end
