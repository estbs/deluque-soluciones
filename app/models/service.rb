class Service < ApplicationRecord
  include ServicesHelper

  validates :datetime_of_service, :status, :service_number, presence: true
  validates :service_number, uniqueness: true
  before_validation :set_params_to_create_service

  belongs_to :quality
  belongs_to :user
  belongs_to :supplier

  enum status: {
    created: 0,
    reviewing: 1,
    checking: 2,
    executing: 3,
    paying: 4,
    finished: 5,
    guarantee: 6
  }

  private

  def set_params_to_create_service
    return unless new_record?

    self.status = Service.statuses[:created]
    self.service_number = generate_service_number
  end
end
