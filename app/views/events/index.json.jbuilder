json.array!(@events) do |event|
	next if event.startdatetime.nil? && event.startdate.nil?
	json.id event.id
	json.title event.name
	if event.startdatetime.nil?
		json.start event.startdate
		json.end event.enddate
	end
	if event.startdate.nil?
		json.start event.startdatetime
		json.end event.enddatetime
	end
	
  # json.extract! event, :id, :title, :description
  # json.start event.start_time
  # json.end event.end_time
  # json.url event_url(event, format: :html)
end