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
end
