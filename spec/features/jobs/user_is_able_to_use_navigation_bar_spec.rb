require 'rails_helper'

  describe "user navigates to companies index"  do
    context "visit[companies_path]"  do
      it  "they click navbar link home and is taken to welcome page"  do

        visit companies_path

      click_link("home-nav")

      expect(current_path).to eq(root_path)
    end
  end
end

require 'rails_helper'

  describe "user navigates to companies index"  do
    context "visit[companies_path]"  do
      it  "they click navbar link jobs and is taken to all jobs page"  do

        visit companies_path

      click_link("jobs-nav")

      expect(current_path).to eq(jobs_path)
    end
  end
end

require 'rails_helper'

  describe "user navigates to companies index"  do
    context "visit[companies_path]"  do
      it  "they click navbar link companies and is taken to all companies index"  do

      visit companies_path

      click_link("companies-nav")

      expect(current_path).to eq(companies_path)
    end
  end
end


require 'rails_helper'

  describe "user navigates to jobs index"  do
    context "visit[company_jobs_path]"  do
      it  "they click navbar link companies and is taken to all companies index"  do
        Category.create!(id: 1, name: "art")
        company = Company.create!(id: 1,name: 'ESPN')
        job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)


      visit 'companies/1/jobs'

      click_link("companies-nav")

      expect(current_path).to eq(companies_path)
    end
  end
end


  describe "user navigates to jobs index"  do
    context "visit[company_jobs_path]"  do
      it  "they click navbar link jobs and is taken to all job index"  do
        Category.create!(id: 1, name: "art")
        company = Company.create!(id: 1,name: 'ESPN')
        job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)


      visit 'companies/1/jobs'

      click_link("jobs-nav")

      expect(current_path).to eq(jobs_path)
    end
  end
end


describe "user navigates to jobs index"  do
  context "visit[company_jobs_path]"  do
    it  "they click home link and is taken to all welcomepage"  do
      Category.create!(id: 1, name: "art")
      company = Company.create!(id: 1,name: 'ESPN')
      job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)


     visit 'companies/1/jobs'

    click_link("home-nav")

    expect(current_path).to eq(root_path)
  end
end
end
