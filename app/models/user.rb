class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # associations
  has_many :forecasts
  has_one :owned_organization, class_name: "Organization", foreign_key: "owner_id"
  has_and_belongs_to_many :organizations
end
