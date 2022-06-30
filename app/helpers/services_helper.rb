module ServicesHelper
  def format_service_number(service_number)
    format('%05d', service_number)
  end

  def generate_service_number
    Service.all.empty? ? 1 : Service.all.last.service_number.to_i + 1
  end

  def get_status_from_i18n(status)
    case status
    when 'created'
      I18n.t('services.statuses.created')
    when 'reviewing'
      I18n.t('services.statuses.created')
    when 'checking'
      I18n.t('services.statuses.created')
    when 'executing'
      I18n.t('services.statuses.created')
    when 'paying'
      I18n.t('services.statuses.created')
    when 'finished'
      I18n.t('services.statuses.created')
    when 'guarantee'
      I18n.t('services.statuses.created')
    else
      ''
    end
  end
end
