class Event < ApplicationRecord

  # validations
  validates :start_date, presence: true
  validates :duration, presence: true

  # associations
  belongs_to :season

  enum state: [ :upcoming, :active, :completed ]

  def end_date
    start_date + duration.days
  end

  def status
    return 1
  end
end
