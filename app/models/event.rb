class Event < ApplicationRecord
  has_many :event_event_class
  has_many :event_classes, through: :event_event_class
  has_many :metric_classes, -> {distinct}, through: :event_classes, dependent: :destroy
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

  def update_metrics(updated_metrics)
    updated_metrics.keys.each do |id|
      metric = metrics.find(id)
      case metric.metric_type
      when Metric.types[:integer]
        val = updated_metrics[id]["int_val"]
        metric.update!(int_val: val)
      when Metric.types[:boolean]
        val = updated_metrics[id]["boolean_val"]
        metric.update!(boolean_val: val)
        # TODO figure out why this is always false in params, but not in post
      when Metric.types[:time]
        hours = updated_metrics[id]["time_val(4i)"]
        minutes = updated_metrics[id]["time_val(5i)"]
        #TODO parse time
      end
    end

    def update_event_classes(event_class_params)
      event_class_params.keys.each do |id|
        event_class = EventClass.find(id)
        next unless event_class
        if event_class_params[id] == "1"
          event_classes << event_class unless event_classes.include? event_class
        else
          event_classes.delete event_class if event_classes.include? event_class
        end
      end
    end
  end

end
