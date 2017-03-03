class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
