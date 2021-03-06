class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.company_average
    self.average(:level_of_interest).round
  end

  def self.companies_with_top_interest
   select('companies.name, avg(jobs.level_of_interest) AS top_average')
  end

  def self.companies_order(score)
    score.joins(:jobs)
    .group(:name)
    .order('top_average DESC')
    .limit(3)
  end
end
