NAMES = ['Important Metric', 'Another Metric']
TYPES = [:integer, :boolean, :time]

FactoryGirl.define do
  factory :metric_class do
    name { NAMES.sample }
    metric_type { TYPES.sample }
  end
end
