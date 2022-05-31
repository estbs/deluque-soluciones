require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:lastname) }
    it { is_expected.to have_db_column(:phone_number) }
    it { is_expected.to have_db_column(:identification_type) }
    it { is_expected.to have_db_column(:identification_number) }
    it { is_expected.to have_db_column(:email) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:address) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_presence_of(:identification_type) }
    it { is_expected.to validate_presence_of(:identification_number) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
