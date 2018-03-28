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

      factory_output = JobFactory.create(50)
      jobs = factory_output[:jobs]
      expected = factory_output[:expected]

      jobs.map do |job|
        job.save
      end

      binding.pry

      output = Job.count_levels_of_interest

      expect(output).to eq(expected)
    end
  end
end
