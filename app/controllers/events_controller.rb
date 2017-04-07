class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event.initialize_metrics
  end

  def edit
    @event = Event.find(params[:id])
    @event.initialize_metrics
  end

  def new
    @event = Event.new
    @event.initialize_metrics
  end

  def create
    @event = Event.create(event_params)
    @event.update_metrics(event_metrics)
    @event.update_event_classes(params[:event_classes])
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update_metrics(event_metrics)
    @event.update(event_params)
    @event.update_event_classes(params[:event_classes])
    redirect_to event_path
  end

  def event_params
    params.require(:event).permit(:name)
  end

  def event_metrics
    params[:event][:metrics] || {}
  end
end
