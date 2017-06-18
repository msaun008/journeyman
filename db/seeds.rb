seasons = Season.create([
  { name: "Spring 2017" },
  # { name: "Summer 2017" },
  # { name: "Fall 2017" },
  # { name: "Winter 2017" },
])

events = Event.create([
  { start_date: DateTime.new(2017,6,1,0,0,0), duration: 1, location: "Melbourne, FL", station: "KMLB", season: seasons[0] },
  { start_date: DateTime.new(2017,7,1,0,0,0), duration: 1, location: "Miami, FL", station: "KMIA", season: seasons[0] },
  { start_date: DateTime.new(2017,8,1,0,0,0), duration: 1, location: "Tallahassee, FL", station: "KTLH", season: seasons[0] },
  { start_date: DateTime.new(2017,9,1,0,0,0), duration: 1, location: "Boston, MA", station: "KBOS", season: seasons[0] },
])

forecasts = Forecast.create([
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 27.9, season: seasons[0], event: events[0] },
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 0, season: seasons[0], event: events[1] },
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 0, season: seasons[0], event: events[2] },
  { high_temp: 90, low_temp: 70, precipitation: 0.25, wind: 12, score: 0, season: seasons[0], event: events[3] },
])
