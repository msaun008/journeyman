FactoryGirl.define do
  factory :event do
    start_date    DateTime.new(2017, 1, 1)
    duration      1
    season
  end
end
