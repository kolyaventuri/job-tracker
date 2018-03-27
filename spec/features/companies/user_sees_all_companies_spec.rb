require 'rails_helper'

describe 'User sees all companies' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end
  
  scenario 'a user sees all the companies' do
    company = Company.create!(name: 'ESPN')
    company_two = Company.create!(name: 'Disney')

    visit companies_path

    expect(page).to have_content('ESPN')
  end

end
