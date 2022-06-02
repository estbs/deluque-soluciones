FactoryBot.define do
  factory :service do
    datetime_of_service { '2022-06-01 20:34:40' }
    status { 'created' }
    service_number { '000001' }
    user
    quality
    supplier
  end
end
