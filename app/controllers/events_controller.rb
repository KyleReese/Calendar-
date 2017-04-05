class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.metrics.concat(handle_metrics)
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.metrics = handle_metrics
    redirect_to event_path
  end

  def handle_metrics
    type_map = {
      int_metric: Metric.types[:integer],
      bool_metric: Metric.types[:boolean],
      time_metric: Metric.types[:time]
    }

    event = params[:event]
    metric_types = [:int_metric, :bool_metric, :time_metric]
    metrics = metric_types.map { |m| {metric: event[m], type: m} }
      .compact
      .map do |m|
          Metric.new(
            int_val: m[:metric][:int_val],
            boolean_val: m[:metric][:bool_val],
            time_val: m[:metric][:time_val],
            metric_type: type_map[m[:type]]
          )
      end
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
