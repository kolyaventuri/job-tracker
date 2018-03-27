require 'rails_helper'


  describe "user navigates to job edit page"  do
    before(:all) do
      DatabaseCleaner.clean
    end

    after(:all) do
      DatabaseCleaner.clean
    end
    
    context "visit[edit_company_job]"  do
      it  "they fill out form and click submit and sees edited job"  do
        category = Category.create!(id: 1, name: "art")
        company = Company.create!(name: 'ESPN')
        job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)

        visit edit_company_job_path(company, job, category)


        fill_in 'job[title]', with: 'Developer'
        fill_in 'job[description]', with: 'So fun!'
        fill_in 'job[level_of_interest]', with: 80
        fill_in 'job[city]', with: 'Denver'

        click_on('Update')

        expect(current_path).to eq company_job_path(company, job)
        expect(page).to have_content('Developer')
        expect(page).to have_content('So fun!')
        expect(page).to have_content(80)
        expect(page).to have_content('Denver')
        expect(page).to have_link('Edit')
        expect(page).to have_link('Delete')
        expect(page).to have_link('ESPN')

      end
    end
  end
