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
end
