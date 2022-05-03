require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET /suppliers' do
    before { get :index }

    context 'When some supplier present' do
      let(:supplier) { create(:supplier) }

      it 'Assigns @suppliers' do
        expect(assigns(:suppliers)).to eq([supplier])
      end
    end

    context 'When no suppliers' do
      it 'Assigns @suppliers' do
        expect(assigns(:suppliers)).to eq([])
      end
    end

    it 'Renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
