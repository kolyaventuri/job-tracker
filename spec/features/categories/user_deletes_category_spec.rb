require 'rails_helper'

describe 'User' do
  cat1 = 'Toast'
  cat2 = 'Bread'

  before(:all) do
    DatabaseCleaner.clean
    Category.create!(name: cat1)
    Category.create!(name: cat2)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'clicks the delete button on category' do
    it 'should delete the category' do
      visit categories_path

      expect(page).to have_content(cat1)
      expect(page).to have_content(cat2)

      within(".category_#{Category.last.id}") do
        click_on 'Delete'
      end

      expect(current_path).to eq(categories_path)
      expect(page).to have_content(cat1)
      expect(page).to_not have_content(cat2)
    end
  end
end