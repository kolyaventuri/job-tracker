require 'rails_helper'

describe 'User visits a company' do
  before(:all) do
    DatabaseCleaner.clean
    company = Company.create!(name: 'ESPN')
    Contact.create!(name: 'Bob', email: 'bob@bob', role: 'PM', company: company)
    Contact.create!(name: 'Sally', email: 'sally@sally', role: 'MG', company: company)

  end

  after(:all) do
    DatabaseCleaner.clean
  end

  scenario 'sees all the contacts' do
    visit company_path(Company.first)
    
    expect(page).to have_content(Contact.first.name)
    expect(page).to have_content(Contact.first.email)
    expect(page).to have_content(Contact.first.role)

    expect(page).to have_content(Contact.last.name)
    expect(page).to have_content(Contact.last.email)
    expect(page).to have_content(Contact.last.role)
  end

end
