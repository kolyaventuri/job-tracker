require 'rails_helper'


describe 'User visits jobs index page' do
  context 'visit[jobs_path]'  do
    it 'sort jobs by city' do
      Category.create!(id: 1 ,name: 'art')
      company = Company.create!(name: 'ESPN')
      company.jobs.create!(title: 'Developer', level_of_interest: 40, city: 'Austin', category_id: 1)
      company.jobs.create!(title: 'QA Analyst', level_of_interest: 40, city: 'Denver', category_id: 1)
      company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)

      visit dashboard_path

      expect(page).to have_content('ESPN')
      expect(page).to have_content('40')
    end
  end
end



describe 'User visits jobs index page' do
  before(:each) do
    DatabaseCleaner.clean
    Category.create!(id: 1, name: 'art')
    company1 = Company.create!(name: 'ESPN')
    company2 = Company.create!(name: 'Dog')
    company3 = Company.create!(name: 'Cat')
    company4 = Company.create!(name: 'Horse')
    company1.jobs.create!(title: 'Developer', level_of_interest: 40, city: 'Austin', category_id: 1)
    company2.jobs.create!(title: 'QA Analyst', level_of_interest: 10, city: 'Denver', category_id: 1)
    company3.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)
    company3.jobs.create!(title: 'QA Analyst', level_of_interest: 40, city: 'Denver', category_id: 1)
    company4.jobs.create!(title: 'Boss', level_of_interest: 5, city: 'Zebra', category_id: 1)
    company4.jobs.create!(title: 'QA Analyst', level_of_interest: 5, city: 'Denver', category_id: 1)
    company4.jobs.create!(title: 'Boss', level_of_interest: 75, city: 'Zebra', category_id: 1)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  context 'visit[jobs_path]' do
    it 'sort jobs by city' do
      visit dashboard_path

      expect(page).to have_content('ESPN')
      expect(page).to have_content('Horse')
      expect(page).to have_content('Cat')
      expect(page).to have_content('40')
      expect(page).to have_content('40')
    end

    it 'displays count of jobs by interest in stars' do
      visit dashboard_path

      within('[data-interest-stars="3.5"]') do
        expect(page).to have_content(1)
      end

      within('[data-interest-stars="2.0"]') do
        expect(page).to have_content(3)
      end

      within('[data-interest-stars="0.5"]') do
        expect(page).to have_content(3)
      end
    end
  end
end
