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

  describe 'visits the categories index' do
    it 'should be able to see all categories' do
      visit categories_path

      expect(page).to have_content(cat1)
      expect(page).to have_content(cat2)
    end
  end
end