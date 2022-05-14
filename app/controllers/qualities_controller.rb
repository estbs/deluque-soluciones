class QualitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @qualities = Quality.all
  end

  def new
    @quality = Quality.new
  end
end
