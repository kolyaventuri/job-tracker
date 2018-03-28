require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visiting a company page' do
    it 'should be able to edit a contact' do
      company  = Company.create!(name: 'ESPN')
      contact1 = Contact.create!(name: 'Bob', email: 'bob@bob', role: 'PM', company: company)
      contact2 = Contact.create!(name: 'Sally', email: 'sally@sally', role: 'MG', company: company)
      new_name = 'Sampson'

      visit company_path(Company.last)

      expect(page).to have_content contact1.name
      expect(page).to have_content contact2.name

      find("#edit_#{contact1.id}").click

      expect(current_path).to eq(edit_company_contact_path(company, contact1))

      fill_in 'contact[name]', with: new_name
      click_on 'Update Contact'

      expect(current_path).to eq(company_path(Company.last))

      expect(page).to have_content new_name
      expect(page).to have_content contact2.name
      expect(page).to_not have_content contact1.name
    end
  end
end