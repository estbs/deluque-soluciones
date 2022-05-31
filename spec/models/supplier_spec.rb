require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:photo) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:address) }
    it { is_expected.to have_and_belong_to_many(:qualities) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
