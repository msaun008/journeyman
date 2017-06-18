class Forecast < ApplicationRecord

  # validations
  validates :precipitation, numericality: { greater_than_or_equal_to: 0.0, allow_nil: true }
  validates :wind, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  # associations
  belongs_to :event
  belongs_to :season
end
