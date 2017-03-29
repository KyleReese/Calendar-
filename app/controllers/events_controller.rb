class EventsController < ApplicationController
  def redirect
    client = Signet::OAuth2::Client.new({
      client_id:  ENV['GOOGLE_OAUTH2_ID'] ,
      client_secret: ENV['GOOGLE_OAUTH2_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    })

    redirect_to client.authorization_uri.to_s
  end
  def callback


    client = Signet::OAuth2::Client.new({
      client_id: ENV['GOOGLE_OAUTH2_ID'],
      client_secret: ENV['GOOGLE_OAUTH2_SECRET'],
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      redirect_uri: callback_url,
      code: params[:code]
    })
    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end
  def calendars
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists

  end
  def google
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    calendar_id = 'primary'
    @event_list = service.list_events(params[:calendar_id],
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
  end
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
