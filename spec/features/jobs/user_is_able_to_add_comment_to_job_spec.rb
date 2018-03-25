require 'rails_helper'

describe 'User visits job show page' do
  context 'visit[company_job_path]'  do
    it 'user writes comment' do
    Category.create!(id: 1, name: "art")
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)

    visit company_job_path(company, job)

    fill_in 'comment[comment]', with: 'This is a fun job man!!'

    click_button("Create Comment")

    expect(page).to have_content('This is a fun job man!!')

    end
  end
end


describe 'User visits job show page' do
  context 'visit[company_job_path]'  do
    it 'user writes multiple comments' do
    Category.create!(id: 1, name: "art")
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: 1)

    visit company_job_path(company, job)

    fill_in 'comment[comment]', with: 'This is a fun job man!!'

    click_button("Create Comment")
    click_link("Back to job")

    fill_in 'comment[comment]', with: 'Not this job'

    click_button("Create Comment")
    click_link("Back to job")

    expect(page).to have_content('This is a fun job man!!')
    expect(page).to have_content('Not this job')
    end
  end
end
