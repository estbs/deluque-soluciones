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

  describe 'GET new' do
    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'Assigns @quality' do
        expect(assigns(:quality)).to be_a_new(Quality)
      end

      it 'Renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    context 'When the user is not signed in' do
      before { get :new }

      it 'Does not render the new template' do
        expect(response).not_to render_template(:new)
      end
    end
  end
end
