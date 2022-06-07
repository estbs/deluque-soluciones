module ServicesHelper
  def format_service_number(service_number)
    format('%05d', service_number)
  end
end
