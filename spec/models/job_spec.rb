require 'rails_helper'

describe Job, type: :model do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:level_of_interest) }
    it { is_expected.to validate_presence_of(:city) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'methods' do
    it 'should be able to return count of jobs by level of interest' do
      company = Company.create!(name: 'ESPN')
      job1 = Job.create(title: 'A', city: 'Denver', level_of_interest: )
    end
  end
end
