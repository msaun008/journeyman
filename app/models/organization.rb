class Organization < ApplicationRecord

  # validations
  validates :name, presence: true

  # associations
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :users
end
