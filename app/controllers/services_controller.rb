class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    @qualities = Quality.all
    @suppliers = Supplier.all
  end
end
