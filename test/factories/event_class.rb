EVENT_CLASS_NAMES = ['Linear Algebra Assignments', 'Work']
TorF = [true, false]
FactoryGirl.define do
  factory :event_class do |event_class|
    name EVENT_CLASS_NAMES.sample
    int_metric TorF.sample
    bool_metric TorF.sample
    time_metric TorF.sample

    factory :event_class_with_events do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        events_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |event_class, evaluator|
        create_list(:event, evaluator.events_count, event_class: event_class)
      end
    end
  end
end
