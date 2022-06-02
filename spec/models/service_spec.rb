require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:datetime_of_service) }
    it { is_expected.to have_db_column(:status) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:supplier) }
    it { is_expected.to belong_to(:quality) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:datetime_of_service) }
    it { is_expected.to validate_presence_of(:status) }
  end
end
