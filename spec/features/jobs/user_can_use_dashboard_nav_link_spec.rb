require 'rails_helper'

describe 'User visits jobs index page' do
  context 'visit[jobs_path]'  do
    it 'sort jobs by city' do
Category.create!(id: 1 ,name: "art")
company = Company.create!(name: 'ESPN')
company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Austin', category_id: 1)
company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'Denver', category_id: 1)
company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)

  visit jobs_path

  click_link("dashboard-nav")

  expect(current_path).to eq(dashboard_path)
   end
 end
end
