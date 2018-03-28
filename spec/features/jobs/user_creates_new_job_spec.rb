require 'rails_helper'

describe 'User creates a new job' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user can create a new job' do
    Category.create!(id: 1, name: "art")
    company = Company.create!(name: 'ESPN')
    visit new_company_job_path(company)

    fill_in 'job[title]', with: 'Developer'
    fill_in 'job[description]', with: 'So fun!'
    fill_in 'job[level_of_interest]', with: 80
    fill_in 'job[city]', with: 'Denver'


    click_button 'Create'

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content('ESPN')
    expect(page).to have_content('Developer')
    expect(page).to have_selector('[data-interest="80"]')
    expect(page).to have_content('Denver')
  end
end
