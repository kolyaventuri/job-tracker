class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def stars
    normalized = level_of_interest / 20.0
    whole_part = normalized.to_i
    partial = normalized - whole_part
    partial = 0.5 unless partial.zero?

    whole_part + partial
  end

  def self.location_group
    order(:city)
  end

  def self.dashboard_group
    Job.all.group_by(&:city)
  end

  def self.filter_city
    Job.where("city = ?", params[:location])
  end

  def self.average
    average(:level_of_interest).round
  end

  def self.count_level_of_interest(rating)
    Job.where(level_of_interest: rating).count
  end

  def self.sorted_level_of_interest
    Job.order(level_of_interest: :desc)
  end

  def self.count_all_levels_of_interest
    Job.group(:level_of_interest).count.sort.to_h
  end
end
