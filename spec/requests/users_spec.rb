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

  describe 'GET show' do
    let(:user) { create(:user) }

    let(:params) do
      { id: user.id }
    end

    context 'When user is signed in' do
      let(:user_logged) { create(:user) }

      before do
        sign_in(user)
        get :show, params: params
      end

      it 'Assigns @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'Renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'When user is not signed in' do
      before { get :show, params: params }

      it 'Does not render the show template' do
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe 'GET edit' do
    let(:user) { create(:user) }

    let(:params) do
      { id: user.id }
    end

    context 'When user is signed in' do
      let(:user_logged) { create(:user) }
      before do
        sign_in(user_logged)
        get :edit, params: params
      end

      it 'Assigns @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'Renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'When user is not signed in' do
      before { get :edit, params: params }

      it 'Does not render the edit template' do
        expect(response).not_to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }

    let(:user) { create(:user, name: 'Esteban', phone_number: '3214567890') }
    context 'When user is signed in' do
      let(:user_logged) { create(:user) }
      before { sign_in(user_logged) }

      context 'with valid params' do
        let(:params) do
          { id: user.id, user: { name: 'Anamaria', phone_number: '3012345432' } }
        end

        it 'Changes the name and the phone number' do
          expect { subject }.to change { user.reload.name }
            .from('Esteban').to('Anamaria')
            .and change { user.reload.phone_number }
            .from('3214567890').to('3012345432')
        end
      end

      context 'with invalid params' do
        let(:params) do
          { id: user.id, user: { name: '' } }
        end

        it 'does not change the name' do
          expect { subject }.not_to change { user.reload.name }
        end
      end
    end

    context 'When user is not signed in' do
      let(:params) do
        { id: user.id, user: { name: 'Anamaria', phone_number: '3012345432' } }
      end

      it 'does not change the name' do
        expect { subject }.not_to change { user.reload.name }
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }

    let!(:user) { create(:user) }
    let(:params) do
      { id: user.id }
    end

    context 'When user is signed in' do
      let(:user_logged) { create(:user) }
      before { sign_in(user_logged) }

      it 'Deletes the user' do
        expect { subject }.to change(User, :count).from(2).to(1)
      end
    end

    context 'When user is not signed in' do
      it 'Does not delete the user' do
        expect { subject }.not_to change(User, :count)
      end
    end
  end
end
