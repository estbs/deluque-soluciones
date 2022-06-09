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

  describe 'POST create' do
    subject { post :create, params: params }

    context 'When user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'Valid params' do
        let(:quality) { create(:quality) }
        let(:supplier) { create(:supplier) }
        let(:params) do
          {
            service: {
              quality_id: quality.id,
              supplier_id: supplier.id,
              user_id: user.id,
              datetime_of_service: DateTime.now,
              service_number: 1
            }
          }
        end

        it 'Creates a new service' do
          expect { subject }.to change(Service, :count).from(0).to(1)
        end
      end

      context 'Invalid params' do
        let(:params) do
          {
            service: { quality_attributes: '', supplier_attributes: '', datetime_of_service: DateTime.now }
          }
        end

        it 'Does not create a new service' do
          expect { subject }.not_to change(Service, :count)
        end
      end
    end

    context 'When user is not signed in' do
      context 'Valid params' do
        let(:quality) { create(:quality) }
        let(:supplier) { create(:supplier) }
        let(:params) do
          {
            service: {
              quality_id: quality.id,
              supplier_id: supplier.id,
              datetime_of_service: DateTime.now,
              service_number: 1
            }
          }
        end

        it 'Does not create a new service' do
          expect { subject }.not_to change(Service, :count)
        end
      end
    end
  end

  describe 'GET show' do
    let(:params) do
      { id: service.id }
    end

    let(:service) { create(:service) }

    context 'When user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :show, params: params
      end

      it 'Assigns @service' do
        expect(assigns(:service)).to eq(service)
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

  describe 'GET Edit' do
    let(:params) do
      { id: service.id }
    end

    let(:service) { create(:service) }

    context 'When user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :edit, params: params
      end

      it 'Assigns @service' do
        expect(assigns(:service)).to eq(service)
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

    context 'When user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      let(:supplier) { create(:supplier) }
      let(:quality) { create(:quality) }

      let(:service) do
        create(
          :service,
          supplier_id: supplier.id,
          quality_id: quality.id,
          user_id: user.id,
          datetime_of_service: '2022-06-01 20:34:40',
          status: 'CREATED',
          service_number: 1,
          comment: 'Additional comment'
        )
      end

      context 'Valid params' do
        let(:supplier2) { create(:supplier) }
        let(:quality2) { create(:quality) }
        let(:params) do
          {
            id: service.id,
            service: {
              supplier_id: supplier2.id,
              quality_id: quality2.id
            }
          }
        end

        it 'Updates services' do
          expect { subject }.to change{ service.reload.supplier_id }
            .and change { service.reload.quality_id }
        end
      end

      context 'Invalid params' do
        let(:params) do
          {
            id: service.id,
            service: {
              supplier_id: nil,
              quality_id: nil
            }
          }
        end

        it 'Does not update service' do
          expect { subject }.not_to change(service, :supplier_id)
        end
      end
    end

    context 'When user is not signed in' do
      let(:supplier) { create(:supplier) }
      let(:quality) { create(:quality) }

      let(:service) do
        create(
          :service,
          supplier_id: supplier.id,
          quality_id: quality.id,
          datetime_of_service: '2022-06-01 20:34:40',
          status: 'CREATED',
          service_number: 1,
          comment: 'Additional comment'
        )
      end

      let(:supplier2) { create(:supplier) }
      let(:quality2) { create(:quality) }
      let(:params) do
        {
          id: service.id,
          service: {
            supplier_id: supplier2.id,
            quality_id: quality2.id
          }
        }
      end

      it 'Does not update service' do
        expect { subject }.not_to change(service, :supplier_id)
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:service) { create(:service) }
    let(:params) do
      { id: service.id }
    end

    context 'When user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      it 'Deletes the service' do
        expect { subject }.to change(Service, :count).from(1).to(0)
      end
    end

    context 'When user is not signed in' do
      it 'Does not delete the service' do
        expect { subject }.not_to change(Service, :count)
      end
    end
  end
end
