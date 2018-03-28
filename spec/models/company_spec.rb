require 'rails_helper'

describe Company, type: :model do
  describe 'validations' do
    before(:all) do
      DatabaseCleaner.clean
    end

    after(:all) do
      DatabaseCleaner.clean
    end

    it { is_expected.to validate_presence_of(:name) }

    it 'requires a unique name' do
      Company.create!(name: 'Fish Inc.')
      company = Company.new(name: 'Fish Inc.')

      expect(company).to be_invalid
    end
  end

  describe 'relationships' do
    it { is_expected.to have_many(:jobs) }
    it { is_expected.to have_many(:contacts) }
  end
end
