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

  describe 'visits a specific category index' do
    it 'should be able to see that categories data' do
      visit category_path(Category.last.id)

      expect(page).to have_content(cat2)
      expect(page).to_not have_content(cat1)
    end
  end
end