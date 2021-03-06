require 'rails_helper'

describe 'User creates a new company' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user can create a new company' do
    visit new_company_path

    fill_in 'company[name]', with: 'ESPN'
    click_button 'Create'

    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content('ESPN')
    expect(Company.count).to eq(1)
  end
end
