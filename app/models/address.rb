class Address < ApplicationRecord
  validates :city, :state, :country, presence: true

  has_one :supplier
  has_one :user
end
