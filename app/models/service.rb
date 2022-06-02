class Service < ApplicationRecord

  validates :datetime_of_service, :status, presence: true

  belongs_to :quality
  belongs_to :user
  belongs_to :supplier
end
