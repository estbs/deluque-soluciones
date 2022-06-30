module Api
  class QualitiesController < BaseController
    def suppliers
      suppliers = Quality.find(params[:quality_id]).suppliers
      respond_with suppliers, json: suppliers
    end
  end
end
