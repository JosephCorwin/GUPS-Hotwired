require 'spec_helper'

RSpec.describe InventoryItem, type: :model do
  let(:inventory_item) { build(:inventory_item) }

  subject { inventory_item }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to_validate_uniqueness_of(:name).scoped_to(:mfg) }
    it { is_expected.to validate_presence_of(:category) }
  end

  describe 'associations' do
    it {
      should have_many(:stocked_items)
        .class_name('StockedItem')
        .dependant(:restrict_with_exception)
    }
  end
end
