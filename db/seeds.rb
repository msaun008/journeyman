seasons = Season.create([
  { name: "Spring 2017" },
  { name: "Summer 2017" },
  { name: "Fall 2017" },
  { name: "Winter 2017" },
])

events = Event.create([
  { start_date: DateTime.new(2017,2,3,4,5,6), duration: 1, location: "Melbourne", station: "KMLB", season: seasons[0] },
  { start_date: DateTime.new(2017,2,3,4,5,6), duration: 1, location: "Miami", station: "KMIA", season: seasons[0] },
  { start_date: DateTime.new(2017,2,3,4,5,6), duration: 1, location: "Tallahassee", station: "KTLH", season: seasons[0] },
])
