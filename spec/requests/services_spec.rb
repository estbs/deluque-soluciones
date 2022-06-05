require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'GET /services' do
    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :index
      end

      context 'When some service exists' do
        let(:service) { create(:service) }

        it 'Assigns @services' do
          expect(assigns(:services)).to eq([service])
        end
      end

      context 'When no services' do
        it 'Assigns @services' do
          expect(assigns(:services)).to eq([])
        end
      end

      it 'Renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'When the user is not signed in' do
      before { get :index }

      it 'Does not render the index template' do
        expect(response).not_to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    context 'When user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'Assigns @service' do
        expect(assigns(:service)).to be_a_new(Service)
      end

      it 'Renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    context 'When user is not signed in' do
      before { get :new }

      it 'Does not render the new template' do
        expect(response).not_to render_template(:new)
      end
    end
  end
end
