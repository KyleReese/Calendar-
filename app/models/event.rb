class Event < ApplicationRecord
  has_many :event_event_class
  has_many :event_classes, through: :event_event_class
  has_many :metric_classes, -> {distinct}, through: :event_classes
  has_many :metrics

  ##
  # Initializes metrics if necessary
  def initialize_metrics
    metric_classes.each do |metric_class|
      next if metrics.find_by(metric_class_id: metric_class.id)
      metrics << Metric.new(
        metric_class_id: metric_class.id,
        metric_type: metric_class.metric_type
      )
    end
  end
end
