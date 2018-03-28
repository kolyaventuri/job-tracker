require_relative '../job_factory'
require 'rails_helper'

describe 'Job Factory' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'should generate a hash of jobs and counts of occurences' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(name: 'Art')

    times = 10
    generated = JobFactory.create(times, company, category)

    expect(generated[:jobs]).to be_instance_of(Array)
    expect(generated[:jobs].length).to be(times)

    generated[:jobs].each do |job|
      expect(job).to be_instance_of(Job)
    end

    expect(generated[:expected].values.sum).to be(times)
  end
end