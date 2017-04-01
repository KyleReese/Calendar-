EVENT_NAMES = ['Awesome Event', 'Another Great Event']


FactoryGirl.define do
  factory :event do
    name EVENT_NAMES.sample
    after(:create) do |event, evaluator|
      # if event.metric_classes.empty
      # byebug
      # [:int_metric, :bool_metric, :time_metric].each do |type|
      #   create(type) if evaluator.event_class[type]
      # end
    end

    factory :event_with_multiple_event_clsses do
      transient do
        event_class_count 3
      end

      after(:create) do |event, evaluator|
        evaluator.event_class_count.times do
          another = EventClass.all.sample
          if(event.event_classes.include? another)
            event.event_classes << another
          end
        end
      end


    end


  end
end
