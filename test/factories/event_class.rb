EVENT_CLASS_NAMES = ['Linear Algebra Assignments', 'Work']
FactoryGirl.define do
  factory :event_class do |event_class|
    name { EVENT_CLASS_NAMES.sample }

    factory :event_class_with_events do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        events_count 5
        metrics_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |event_class, evaluator|
        create_list(:metric_class, evaluator.metrics_count, event_class: event_class)
        create_list(:event_with_multiple_event_clsses, evaluator.events_count, event_classes: [event_class])
      end
    end
  end
end
