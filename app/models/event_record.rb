class EventRecord < ApplicationRecord
  # validations

  # associations
  belongs_to :event
  belongs_to :observed_forecast, class_name: "Forecast", optional: true
end
