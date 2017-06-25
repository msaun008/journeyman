class Season < ApplicationRecord

  # validations
  validates :name, presence: true

  # associations
  has_many :events
  has_many :forecasts
  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
end
