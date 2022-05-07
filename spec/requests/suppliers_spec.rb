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

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: supplier.id }
    end

    let(:supplier) { create(:supplier) }

    it 'Assigns @word' do
      expect(assigns(:supplier)).to eq(supplier)
    end

    it 'Renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'Assigns @supplier' do
      expect(assigns(:supplier)).to be_a_new(Supplier)
    end

    it 'Renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

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

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: supplier.id }
    end

    let(:supplier) { create(:supplier) }

    it 'Assigns @supplier' do
      expect(assigns(:supplier)).to eq(supplier)
    end

    it 'Renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    before { get :edit, params: params }

    let(:params) do
      { id: supplier.id }
    end

    let(:supplier) { create(:supplier) }

    it 'Assigns @supplier' do
      expect(assigns(:supplier)).to eq(supplier)
    end

    it 'Renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    let(:supplier) { create(:supplier, name: 'test supllier 1', address_attributes: address1) }
    let(:address1) { create(:address, street: 'street1', city: 'city1', state: 'state1', country: 'country1') }
    let(:address2) { create(:address, street: 'street2', city: 'city2', state: 'state2', country: 'country2') }

    context 'Valid params' do
      subject { put :update, params: params }
      let(:params) do
        { id: supplier.id, supplier: { name: 'test supp 1', address_attributes: address2 } }
      end

      it 'Updates supplier' do
        expect{ subject }.to change { supplier.reload.name }
          .from('test supplier 1').to('test supp 1')
          .and change { supplier.reload.address }
          .from(address1).to(address2)
      end
    end

    context 'Invalid params' do
      subject { put :update, params: params }
      let(:params) do
        { id: supplier.id, supplier: { name: '' } }
      end

      it 'does not update supplier' do
        expect { subject }.not_to change { supplier.reload.name }
      end
    end
  end
end
