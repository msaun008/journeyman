class Event < ApplicationRecord

  # validations
  validates :start_date, presence: true
  validates :duration, presence: true

  # associations
  belongs_to :season
  has_many :forecasts
  has_one :event_record
  has_one :observed_forecast, class_name: "Forecast", through: :event_record

  def end_date
    start_date + duration.days - 1.second
  end

  def status
    status = "Active"

    if is_upcoming?
      status = "Upcoming"
    elsif is_completed?
      status = "Completed"
    end
  end

  def is_active?
    today = DateTime.now
    today > start_date && today < end_date
  end

  def is_completed?
    DateTime.now > end_date
  end

  def is_upcoming?
    DateTime.now < start_date
  end
end
