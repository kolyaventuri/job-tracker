require 'rails_helper'

    describe 'User visits jobs index page' do
      context 'visit[jobs_path]'  do
        it 'sort jobs by city' do
    Category.create!(id: 1 ,name: "art")
    company = Company.create!(name: 'ESPN')
    company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Austin', category_id: 1)
    company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'Denver', category_id: 1)
    company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)

     visit dashboard_path

     click_link("interest_sort")

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
      company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Austin', category_id: 1)
      company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'Denver', category_id: 1)
      company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)

      visit dashboard_path

      click_link("city_sort")

      expect("Austin").to appear_before("Denver")
      expect("Denver").to appear_before("Zebra")
    end
  end
end




    describe 'User visits jobs index page' do
      context 'visit[jobs_path]'  do
        it 'sort jobs by city' do
      Category.create!(id: 1 ,name: "art")
      company = Company.create!(name: 'ESPN')
      company.jobs.create!(title: 'Developer', level_of_interest: 100, city: 'Austin', category_id: 1)
      company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'Denver', category_id: 1)
      company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Zebra', category_id: 1)
      company.jobs.create!(title: 'QA Analyst', level_of_interest: 80, city: 'Cat', category_id: 1)
      company.jobs.create!(title: 'Boss', level_of_interest: 40, city: 'Pie', category_id: 1)


      visit dashboard_path

      click_link("city_sort")

      expect("Austin").to appear_before("Cat")
      expect("Cat").to appear_before("Denver")
      expect("Denver").to appear_before("Pie")
      expect("Pie").to appear_before("Zebra")
    end
  end
end
