require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET /suppliers' do
    before { get :index }

    it 'Renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
