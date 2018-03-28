require 'rails_helper'

  describe "user navigates to welcome page"  do
    context "visit[root_path]"  do
      it  "they click navbar link jobs and is taken to jobs index"  do

        visit root_path

      click_link("jobs-nav")

      expect(current_path).to eq(jobs_path)
    end
  end
end

describe "user navigates to welcome page"  do
  context "visit[root_path]"  do
    it  "they click navbar link companies and is taken to companies index"  do

      visit root_path

    click_link("companies-nav")

    expect(current_path).to eq(companies_path)
    end
  end
end

describe "user navigates to welcome page"  do
  context "visit[root_path]"  do
    it  "they click navbar link dashboard_path and is taken to companies index"  do

      visit root_path

    click_link("dashboard-nav")

    expect(current_path).to eq(dashboard_path)
    end
  end
end
