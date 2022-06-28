require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET /index" do
    context 'When user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :index
      end

      it 'Render the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'When user is not signed in' do
      before { get :index }

      it 'Does not renden the index template' do
        expect(response).not_to render_template(:index)
      end
    end
  end
end
