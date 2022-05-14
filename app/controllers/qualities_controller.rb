class QualitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @qualities = Quality.all
  end

  def new
    @quality = Quality.new
  end

  def create
    @quality = Quality.new(quality_params)

    if @quality.save
      redirect_to quality_path(@quality)
    else
      render :new
    end
  end

  def show
    @quality = Quality.find(params[:id])
  end

  def edit
    @quality = Quality.find(params[:id])
  end

  private

  def quality_params
    params.require(:quality)
          .permit(
            :name,
            :description
          )
  end
end
