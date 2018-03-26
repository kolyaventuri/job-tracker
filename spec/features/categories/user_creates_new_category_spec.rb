require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new category' do
    visit new_categories_path

    fill_in 'category[name]', with: 'Cat1'
    click_button 'Create Category'

    expect(current_path).to eq("/categories/#{Category.last.id}/")
    expect(page).to have_content('Cat1')
    expect(Category.count).to eq(1)
  end
end
