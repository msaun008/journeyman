class Season < ApplicationRecord

  # validations
  validates :name, presence: true

  # associations
  has_many :events
end
