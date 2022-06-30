class QualitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_quality, only: %i[show edit update destroy]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @quality.update(quality_params)
      redirect_to quality_path(@quality)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quality.destroy
    redirect_to qualities_path
  end

  private

  def quality_params
    params.require(:quality)
          .permit(
            :name,
            :description
          )
  end

  def assign_quality
    @quality = Quality.find(params[:id])
  end
end
