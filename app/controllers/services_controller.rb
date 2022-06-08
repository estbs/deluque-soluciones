class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.status = 'CREATED'
    @service.user = current_user
    @service.service_number = generate_service_number
    if @service.save
      redirect_to :services
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  private

  def service_params
    params.require(:service)
          .permit(
            :quality_id,
            :supplier_id,
            :datetime_of_service,
            :comment
          )
  end

  def generate_service_number
    Service.all.empty? ? 1 : Service.all.last.service_number.to_i + 1
  end
end
