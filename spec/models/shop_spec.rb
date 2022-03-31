require 'spec_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { build(:shop, :with_cabs) }

  subject { shop }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :code_name }
    it { is_expected.to validate_length_of(:code_name).is_at_least(2).is_at_most(5) }
    it { is_expected.to validate_uniqueness_of :code_name }
    it { is_expected.to validate_presence_of :domain }
    it { is_expected.to validate_uniqueness_of :domain }
    it { is_expected.to validate_presence_of :logo }
  end

  describe 'associations' do
    it {
      should have_many(:applicants)
        .class_name('Applicant')
        .dependant(:destroy)
    }

    it{
      should have_many(:cabs)
        .class_name('Cab')
    }

    it {
      should have_many(:contracts)
        .class_name('Contract')
        .dependant(:restrict_with_exception)
    }

    it {
      should have_many(:stocked_items)
        .class_name('StockedItem')
        .dependant(:restrict_with_exception)
    }

    it { 
      should have_one(:logo)
        .class_name('Image')
        .dependant(:destroy)
    }

    it {
      should have_many(:pages)
        .class_name('Page')
        .dependant(:destroy)
    }

    it {
      should have_many(:questions)
        .class_name('Question')
    }
  end
end
