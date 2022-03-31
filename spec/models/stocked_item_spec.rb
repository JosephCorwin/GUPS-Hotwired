require 'spec_helper'

RSpec.describe IStockedItem, type: :model do
  let(:stocked_item) { build(:stocked_item) }

  subject { stocked_item }

  it { is_expected.to be_valid }

  describe 'associations' do
    it {
      is_expected.to belong_to(:inventory_item)
        .class_name('InventoryItem')
        .required
    }

    it {
      is_expected.to belong_to(:stockable)
        .required
    }
  end
end
