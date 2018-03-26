require 'rails_helper'

describe 'User' do
  scenario 'can create a new category' do
    visit new_category_path

    fill_in 'category[name]', with: 'Cat1'
    click_button 'Create Category'

    expect(current_path).to eq(category_path(Category.last.id))
    expect(page).to have_content('Cat1')
    expect(Category.count).to eq(1)
  end

  scenario 'can cancel creation of the category' do
    visit new_category_path

    click_on 'Cancel'

    expect(current_path).to eq(categories_path)
  end
end
