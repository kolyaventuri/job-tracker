require 'rails_helper'

describe 'User' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'visiting a company' do
    it 'should be able to add a contact' do
      company = Company.create!(name: 'ESPN')
      name = 'Bob Ross'
      role = 'Painter'
      email = 'Bob@BobRoss.com'

      visit company_path(company)

      fill_in 'contact[name]', with: name
      fill_in 'contact[role]', with: role
      fill_in 'contact[email]', with: email

      click_on 'Create Contact'

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content(name)
      expect(page).to have_content(role)
    end
  end
end