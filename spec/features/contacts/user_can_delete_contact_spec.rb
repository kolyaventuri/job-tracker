require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visiting a company page' do
    it 'should be able to delete a contact' do
      company  = Company.create!(name: 'ESPN')
      contact1 = Contact.create!(name: 'Bob', email: 'bob@bob', role: 'PM', company: company)
      contact2 = Contact.create!(name: 'Sally', email: 'sally@sally', role: 'MG', company: company)

      visit company_path(company)

      expect(page).to have_content contact1.name
      expect(page).to have_content contact2.name

      find("#delete_#{contact1.id}").click

      expect(current_path).to eq(company_path(company))
      within('.contacts') do
        expect(page).to have_content contact2.name
        expect(page).to_not have_content contact1.name
      end
    end
  end
end