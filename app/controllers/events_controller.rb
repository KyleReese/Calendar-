class EventsController < ApplicationController
  def index
    @events = Event.all
    Event.sync_google_events GoogleCalendarService.events session["token"]
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @event.initialize_metrics
  end

  def edit
    @user = current_user
    @event = Event.find(params[:id])
    @event.initialize_metrics
  end

  def new
    @user = current_user
    @event = Event.new
    @event.initialize_metrics
  end

  def create
    @event = Event.create(event_params)
    @event.update_metrics(event_metrics)
    @event.update_event_classes(params[:event_classes])
    redirect_to user_events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to user_events_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update_metrics(event_metrics)
    @event.update(event_params)
    @event.update_event_classes(params[:event_classes])
    redirect_to user_event_path
  end

  def event_params
    params.require(:event).permit(:name)
  end

  def event_metrics
    params[:event][:metrics] || {}
  end
end
