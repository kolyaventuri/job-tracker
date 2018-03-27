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

  describe 'clicks the edit button of a category' do
    it 'should go to the edit page' do
      visit categories_path

      within(".category_#{Category.last.id}") do
        click_on 'Edit'

        expect(current_path).to eq(edit_category_path(Category.last.id))
        expect(page).to have_content(Category.last.name)
      end
    end
  end

  describe 'edits a category' do
    it 'should update the name of the category' do
      visit edit_category_path(Category.last.id)

      fill_in 'category[name]', with: 'Ham and Cheese'

      click_on 'Update Category'

      expect(current_path).to eq(categories_paths)
      within('#category_list') do
        expect(page).to have_content('Ham and Cheese')
      end
    end
  end
end
