require 'rails_helper'

describe 'User visits jobs index page' do
  context 'visit[jobs_path]'  do
    it 'sort jobs by city' do
Category.create!(id: 1 ,name: "art")
company = Company.create!(name: 'ESPN')
company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Denver', category_id: 1)
company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'New York City', category_id: 1)
company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'New York City', category_id: 1)

  visit jobs_path

  click_link("second")

  expect("Developer").to appear_before("QA Analyst")
  expect("QA Analyst").to appear_before("Boss")

    end
   end
  end

  describe 'User visits jobs index page' do
    context 'visit[jobs_path]'  do
      it 'sort jobs by city' do
  Category.create!(id: 1 ,name: "art")
  company = Company.create!(name: 'ESPN')
  company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Denver', category_id: 1)
  company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'New York City', category_id: 1)
  company.jobs.create!(title: 'Boss', level_of_interest: 70, city: 'New York City', category_id: 1)
  company.jobs.create!(title: 'cat', level_of_interest: 60, city: 'Denver', category_id: 1)
  company.jobs.create!(title: 'dog', level_of_interest: 50, city: 'New York City', category_id: 1)
  company.jobs.create!(title: 'fish', level_of_interest: 40, city: 'New York City', category_id: 1)

    visit jobs_path

    click_link("second")

    expect("Developer").to appear_before("QA Analyst")
    expect("QA Analyst").to appear_before("Boss")
    expect("cat").to appear_before("dog")
    expect("dog").to appear_before("fish")

      end
     end
    end
