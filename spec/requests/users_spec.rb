require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /users' do
    context 'When user is signed in' do
      let(:user_logged) { create(:user) }

      before do
        sign_in(user_logged)
        get :index
      end

      context 'When some user present' do
        let(:user) { create(:user) }

        it 'Assigns @users' do
          expect(assigns(:users)).to eq([user_logged, user])
        end
      end

      context 'When no users' do
        it 'Assigns @users' do
          expect(assigns(:users)).to eq([user_logged])
        end
      end

      it 'Renders the index template' do
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
