class QualitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @qualities = Quality.all
  end
end
