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
