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

  describe 'POST create' do
    subject { post :create, params: params }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'Valid params' do
        let(:quality) { { name: 'Plumber', description: 'Work with tubes' } }
        let(:params) do
          {
            quality: { name: 'Carpenter', description: 'Work with wood' }
          }
        end

        it 'Creates a new quality' do
          expect { subject }.to change(Quality, :count).from(0).to(1)
        end
      end

      context 'Invalid params' do
        let(:params) do
          {
            quality: { name: '' }
          }
        end

        it 'does not create a new supplier' do
          expect { subject }.not_to change(Quality, :count)
        end
      end
    end

    context 'When the user is not signed in' do
      context 'Valid params' do
        let(:quality) { { name: 'Plumber', description: 'Work with tubes' } }
        let(:params) do
          {
            quality: { name: 'Carpenter', description: 'Work with wood' }
          }
        end

        it 'Does not create a new supplier' do
          expect { subject }.not_to change(Quality, :count)
        end
      end
    end
  end

  describe 'GET show' do
    let(:params) do
      { id: quality.id }
    end

    let(:quality) { create(:quality) }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :show, params: params
      end

      it 'Assigns @quality' do
        expect(assigns(:quality)).to eq(quality)
      end

      it 'Renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'When the user is not signed in' do
      before { get :show, params: params }

      it 'Does not render the show template' do
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe 'GET edit' do
    let(:params) do
      { id: quality.id }
    end

    let(:quality) { create(:quality) }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :edit, params: params
      end

      it 'Assigns @quality' do
        expect(assigns(:quality)).to eq(quality)
      end

      it 'Renders the show template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'When the user is not signed in' do
      before { get :edit, params: params }

      it 'Does not render the show template' do
        expect(response).not_to render_template(:edit)
      end
    end
  end
end
