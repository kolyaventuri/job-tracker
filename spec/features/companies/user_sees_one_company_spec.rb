require 'rails_helper'

describe 'User sees one company' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user sees a company' do
    Category.create!(id: 1, name: "art")
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: 90, city: 'Denver', category_id: 1)

    visit company_path(company)

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('ESPN')
  end
end
