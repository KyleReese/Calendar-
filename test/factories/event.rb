EVENT_NAMES = ['Awesome Event', 'Another Great Event']


FactoryGirl.define do
  factory :event do
    name EVENT_NAMES.sample
    after(:create) do |event, evaluator|
      # byebug
      # [:int_metric, :bool_metric, :time_metric].each do |type|
      #   create(type) if evaluator.event_class[type]
      # end
    end
  end
end
