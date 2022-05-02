class Address < ApplicationRecord
  validates :city, :state, :country, presence: true
end
