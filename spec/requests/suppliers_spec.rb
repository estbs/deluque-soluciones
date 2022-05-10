require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do
  describe 'GET /suppliers' do
    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :index
      end

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

    context 'When the user is not signed in' do
      before { get :index }

      it 'Does not render the index template' do
        expect(response).not_to render_template(:index)
      end
    end
  end

  describe 'GET show' do
    let(:params) do
      { id: supplier.id }
    end

    let(:supplier) { create(:supplier) }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :show, params: params
      end

      it 'Assigns @word' do
        expect(assigns(:supplier)).to eq(supplier)
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

  describe 'GET new' do
    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'Assigns @supplier' do
        expect(assigns(:supplier)).to be_a_new(Supplier)
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
        let(:address) { { street: 'street', city: 'city', state: 'state', country: 'country' } }
        let(:params) do
          {
            supplier: { name: 'EBS supplier', address_attributes: address }
          }
        end

        it 'Creates a new supplier' do
          expect { subject }.to change(Supplier, :count).from(0).to(1)
        end
      end

      context 'Invalid params' do
        let(:params) do
          {
            supplier: { name: '' }
          }
        end

        it 'does not create a new supplier' do
          expect { subject }.not_to change(Supplier, :count)
        end
      end
    end

    context 'When the user is not signed in' do
      context 'Valid params' do
        let(:address) { { street: 'street', city: 'city', state: 'state', country: 'country' } }
        let(:params) do
          {
            supplier: { name: 'EBS supplier', address_attributes: address }
          }
        end

        it 'Does not create a new supplier' do
          expect { subject }.not_to change(Supplier, :count)
        end
      end
    end
  end

  describe 'GET show' do
    let(:supplier) { create(:supplier) }

    let(:params) do
      { id: supplier.id }
    end

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :show, params: params
      end

      it 'Assigns @supplier' do
        expect(assigns(:supplier)).to eq(supplier)
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
      { id: supplier.id }
    end

    let(:supplier) { create(:supplier) }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :edit, params: params
      end

      it 'Assigns @supplier' do
        expect(assigns(:supplier)).to eq(supplier)
      end

      it 'Renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'When the user is not signed in' do
      before { get :edit, params: params }

      it 'Does not render the edit template' do
        expect(response).not_to render_template(:edit)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }

    context 'When the user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      let(:supplier) do
        create(
          :supplier,
          name: 'test supplier 1',
          address_attributes: {
            street: 'street1',
            city: 'city1',
            state: 'state1',
            country: 'country1'
          }
        )
      end

      context 'Valid params' do
        let(:params) do
          {
            id: supplier.id,
            supplier: {
              name: 'test supp 1',
              address_attributes: {
                id: supplier.address.id,
                street: 'street2'
              }
            }
          }
        end

        it 'Updates supplier' do
          expect { subject }.to change { supplier.reload.name }
            .from('test supplier 1').to('test supp 1')
            .and change { supplier.reload.address.street }
            .from('street1').to('street2')
        end
      end

      context 'Invalid params' do
        let(:params) do
          { id: supplier.id, supplier: { name: '' } }
        end

        it 'does not update supplier' do
          expect { subject }.not_to change { supplier.reload.name }
        end
      end
    end

    context 'When the user is not signed in' do
      let(:supplier) do
        create(
          :supplier,
          name: 'test supplier 1',
          address_attributes: {
            street: 'street1',
            city: 'city1',
            state: 'state1',
            country: 'country1'
          }
        )
      end

      let(:params) do
        {
          id: supplier.id,
          supplier: {
            name: 'test supp 1',
            address_attributes: {
              id: supplier.address.id,
              street: 'street2'
            }
          }
        }
      end

      it 'Does not update supplier' do
        expect { subject }.not_to change { supplier.reload.name }
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:supplier) { create(:supplier) }
    let(:params) do
      { id: supplier.id }
    end

    context 'When user is signed in' do
      let(:user) { create(:user) }
      before { sign_in(user) }

      it 'deletes supplier' do
        expect { subject }.to change(Supplier, :count).from(1).to(0)
      end
    end

    context 'When user is not signed in' do
      it 'Does not delete supplier' do
        expect { subject }.not_to change(Supplier, :count)
      end
    end
  end
end
