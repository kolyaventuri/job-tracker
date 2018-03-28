require 'rails_helper'

describe 'User sees a specific job' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user sees a job for a specific company' do
    Category.create!(id: 1, name: "art")
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)

    visit company_job_path(company, job)

    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_selector('[data-interest="70"]')
  end
end
