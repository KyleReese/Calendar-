FactoryGirl.define do
  factory :int_metric, class: Metric do
    int_val 4
    metric_type Metric.types[:integer]
  end

  factory :bool_metric, class: Metric do
    boolean_val true
    metric_type Metric.types[:boolean]
  end

  factory :time_metric, class: Metric do
    time_val Time.new(2000)
    metric_type Metric.types[:time]
  end
end
