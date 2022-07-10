class ServiceHistory < ApplicationRecord
  enum status: {
    created: 0,
    reviewing: 1,
    checking: 2,
    executing: 3,
    paying: 4,
    finished: 5,
    guarantee: 6
  }

  def create_service_history_by_service(service)
    self.attributes = service.attributes
    self.service_id = service.id
    save
  end
end
