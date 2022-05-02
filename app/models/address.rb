class Address < ApplicationRecord
  validates :city, :state, :country, presence: true

  has_one :supplier
end
