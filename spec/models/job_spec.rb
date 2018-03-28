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
    before(:each) do
      DatabaseCleaner.clean
      company = Company.create!(name: 'ESPN')
      category = Category.create!(name: 'Art')

      factory_output = JobFactory.create(50, company, category)

      @expected = factory_output[:expected]
    end
    it 'should be able to return count of jobs by level of interest' do
      output = Job.count_all_levels_of_interest

      expect(output).to eql(@expected)
    end

    it 'should be able to return count of jobs for a single interest level' do
      output = Job.count_level_of_interest(3)

      expect(output).to eql(@expected[3])
    end

    it 'should be able to normalize interest to [0-5]' do
      company = Company.create!(name: 'Toast')
      category = Category.create!(name: 'Graph')
      job1 = Job.new(title: 'A', level_of_interest: 0, company: company, category: category)
      job2 = Job.new(title: 'A', level_of_interest: 25, company: company, category: category)
      job3 = Job.new(title: 'A', level_of_interest: 50, company: company, category: category)
      job4 = Job.new(title: 'A', level_of_interest: 60, company: company, category: category)

      expect(job1.stars).to be(0.0)
      expect(job2.stars).to be(1.5)
      expect(job3.stars).to be(2.5)
      expect(job4.stars).to be(3.0)
    end
  end
end
