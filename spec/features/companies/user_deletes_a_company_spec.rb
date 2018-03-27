require 'rails_helper'

describe 'User deletes existing company' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'a user can delete a company' do
    company = Company.create(name: 'ESPN')
    visit companies_path

    find("#delete_#{company.id}").click

    expect(page).to have_content('ESPN was successfully deleted!')
  end
end
