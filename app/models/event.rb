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

  def self.sync_google_events(events)
    events.items.each do |e|
      event = Event.find_by(event_calendar_id: e.id)
      if event.nil?
        Event.create(event_calendar_id: e.id, name: e.summary, startdate: e.start.date, startdatetime: e.start.date_time, enddate: e.end.date, enddatetime: e.end.date_time)
      end
    end
  end


  #trying to get all the ids that are recurring by cutting ending time of id as that is the
  #only difference then do what you were doing with the one event
  def self.update_event_classes(event,event_class_params)
    if event.event_calendar_id != nil
      r_id = event.event_calendar_id.to_s.first(-17)
      events = Event.where('event_calendar_id ILIKE ?',"%#{r_id}%")
      events.each do |i|
        i.update_event_classes(event_class_params)
        end
      else
        event.update_event_classes(event_class_params)
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




  def update_metrics(updated_metrics)
    updated_metrics.keys.each do |id|
      metric = metrics.find(id)
      case metric.metric_type
      when Metric.types[:integer]
        val = updated_metrics[id]["int_val"]
        metric.update!(int_val: val)
      when Metric.types[:boolean]
        type_map = {"1" => true, "0" => false}
        val = type_map[updated_metrics[id]["boolean_val"].first]
        metric.update!(boolean_val: val)
      when Metric.types[:time]
        hours = updated_metrics[id]["time_val(4i)"]
        minutes = updated_metrics[id]["time_val(5i)"]
        time = Time.new(2000, 1, 1, hours, minutes)
        time = Time.zone.local_to_utc(time)#make sure it doesn't take the liberty of changing to 7 hours ahead unannounced
        metric.update!({time_val: time})
        #TODO parse time
      end
    end


  end

end
