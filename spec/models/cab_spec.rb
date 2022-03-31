require 'spec_helper'

RSpec.describe Cab, type: :model do
  let(:cab) { build(:cab) }

  subject { cab }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of :make }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :serial_no }
    it { is_expected.to validate_uniqueness_of(:serial_no).scoped_to(:make) }
    it { is_expected.to validate_presence_of :fleet_no }
    it { is_expected.to validate_uniqueness_of(:fleet_no).scoped_to(:shop) }
  end

  describe 'associations' do
    it { 
      is_expected.to belong_to(:shop)
        .class_name('Shop')
    }

    it {
      should have_many(:contracts)
        .class_name('Contract')
    }

    it {
      should have_many(:stocked_items)
        .class_name('StockedItem')
        .dependant(:restrict_with_exception)
    }
  end
end
