NAMES = ['Questions']
TYPES = [:integer, :boolean, :time]

FactoryGirl.define do
  factory :metric_class do
    name NAMES.sample
    metric_type TYPES.sample

    # after(:create) do |metric_class, evaluator|
      # [:int_metric, :bool_metric, :time_metric].each do |type|
        # create(type) if evaluator.event_class[type]
      # end
    # end
  end
end
