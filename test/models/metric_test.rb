require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates" do
    good = Metric.new(type: Metric.types[:integer])
    bad = Metric.new(type: "nonsense")
    # TODO figure out test throws with minitest
  end
end
