class Season < ApplicationRecord

  # validations
  validates :name, presence: true

  # associations
  has_many :events
  has_many :forecasts

  accepts_nested_attributes_for :events, allow_destroy: true
end
