require 'rails_helper'

RSpec.describe QualitiesController, type: :controller do
  describe 'GET /index' do
    context 'When user is signed in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :index
      end

      context 'When some quality present' do
        let(:quality) { create(:quality) }

        it 'Assigns @qualities' do
          expect(assigns(:qualities)).to eq([quality])
        end
      end

      context 'When no qualities present' do
        it 'Assigns @qualities' do
          expect(assigns(:qualities)).to eq([])
        end
      end

      it 'Render the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'When user is not signed in' do
      before { get :index }

      it 'Does not render the index template' do
        expect(response).not_to render_template(:index)
      end
    end
  end
end
