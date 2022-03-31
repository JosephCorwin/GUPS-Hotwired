require 'rails_helper'

RSpec.describe Cab, type: :model do
  let(:cab) { build(:cab) }

  subject { cab }

  it { is_expected.to }

  describe 'validations' do
    it { is_expected.to validate_presence_of :make }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :serial_no }
    it { is_expected.to validate_uniqueness_of :serial_no }
    it { is_expected.to validate_presence_of :fleet_no }
    it { is_expected.to validate_uniqueness_of :fleet_no }
  end

  describe 'associations' do
    it { 
      is_expected.to belong_to(:shop)
        .className('Shop')
    }

    it {
      should have_many(:contracts)
        .className('Contract')
    }

    it {
      should have_many(:inventory_items)
        .className('InventoryItem')
        .dependant(:restrict_with_exception)
    }
  end
end
