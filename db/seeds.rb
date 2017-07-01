users = User.create([
  { email: "admin@gmail.com", password: "111111", password_confirmation: "111111", admin: true },
  { email: "user@gmail.com", password: "111111", password_confirmation: "111111" },
])

admin_user = users[0]

organizations = Organization.create([
  { name: "Justice League", owner: admin_user }
])

seasons = Season.create([
  { name: "Spring 2017", owner: admin_user },
  # { name: "Summer 2017" },
  # { name: "Fall 2017" },
  # { name: "Winter 2017" },
])

events = Event.create([
  { start_date: DateTime.new(2017,6,1,0,0,0), duration: 1, location: "Melbourne, FL", station: "KMLB", season: seasons[0] },
  { start_date: DateTime.new(2017,7,1,0,0,0), duration: 1, location: "Miami, FL", station: "KMIA", season: seasons[0] },
  { start_date: DateTime.new(2017,8,1,0,0,0), duration: 1, location: "Tallahassee, FL", station: "KTLH", season: seasons[0]},
  { start_date: DateTime.new(2017,9,1,0,0,0), duration: 1, location: "Boston, MA", station: "KBOS", season: seasons[0] },
])

event_records = []
events.each do |e|
  # create an event_record
  er = EventRecord.create(event: e)
  event_records << er

  # update the event with the event_record
  e.event_record = er
  e.save
end

forecasts = Forecast.create([
  { high_temp: 90, low_temp: 70, precipitation: 0.0, wind: 12, score: 0, season: seasons[0], event: events[0], user: admin_user },
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 0, season: seasons[0], event: events[1], user: admin_user },
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 0, season: seasons[0], event: events[2], user: admin_user },
])

observed_forecasts = Forecast.create([
  { high_temp: 91, low_temp: 72, precipitation: 0.9, wind: 12, score: 0, season: seasons[0], event: events[0] },
])

er0 = event_records[0]
er0.observed_forecast = observed_forecasts[0]
er0.save
