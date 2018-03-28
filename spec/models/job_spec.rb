require 'rails_helper'
require_relative '../job_factory'

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
      category = Category.create!(name: 'Art')

      factory_output = JobFactory.create(50, company, category)

      expected = factory_output[:expected]

      output = Job.count_levels_of_interest

      expect(output).to eql(expected)
    end

    it 'should be able to return count of jobs for a single interest level' do
      
    end
  end
end
