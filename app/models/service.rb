class Service < ApplicationRecord
  validates :datetime_of_service, :status, :service_number, presence: true
  validates :service_number, uniqueness: true

  belongs_to :quality
  belongs_to :user
  belongs_to :supplier
end
