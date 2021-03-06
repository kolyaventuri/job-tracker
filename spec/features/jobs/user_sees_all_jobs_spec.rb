require 'rails_helper'

describe 'User sees all jobs' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user sees all the jobs for a specific company' do
    Category.create!(id: 1, name: 'art')
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)
    company.jobs.create!(title: 'QA Analyst', level_of_interest: 70, city: 'New York City', category_id: 1)

    visit jobs_path

    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_content('QA Analyst')
  end
end
