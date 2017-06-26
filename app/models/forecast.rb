class Forecast < ApplicationRecord

  # validations
  validates :precipitation, numericality: { greater_than_or_equal_to: 0.0, allow_nil: true }
  validates :wind, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # associations
  belongs_to :season
  belongs_to :event

  # If the forecast is the observed forecast, then it does not need to be associated with a user
  belongs_to :user, optional: true
end
