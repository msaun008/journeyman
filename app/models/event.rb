class Event < ApplicationRecord

  # validations
  validates :start_date, presence: true
  validates :duration, presence: true

  # associations
  belongs_to :season
end
