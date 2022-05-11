require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:street) }
    it { is_expected.to have_db_column(:city) }
    it { is_expected.to have_db_column(:state) }
    it { is_expected.to have_db_column(:country) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:supplier) }
    it { is_expected.to have_one(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
  end
end
