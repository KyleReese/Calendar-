require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates" do
    good = Metric.new(metric_type: Metric.types[:integer])
    bad = Metric.new(metric_type: "nonsense")

    assert_raises(ActiveRecord::RecordInvalid) { bad.save! }
    good.save!
  end
end
