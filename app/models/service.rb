class Service < ApplicationRecord
  include ServicesHelper

  validates :datetime_of_service, :status, :service_number, presence: true
  validates :service_number, uniqueness: true
  before_validation :set_params_to_create_service
  after_create :create_service_history
  after_update :create_service_history

  belongs_to :quality
  belongs_to :user
  belongs_to :supplier
  has_many :service_histories

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

  def create_service_history
    service_history = ServiceHistory.new
    service_history.create_service_history_by_service(self)
  end
end
