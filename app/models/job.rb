class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def stars
    Job.to_stars(level_of_interest)
  end

  def whole_stars
    stars.to_i
  end

  def half_star?
    stars == stars.to_i
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
    rating = to_stars(rating)
    count_all_levels_of_interest[rating]
  end

  def self.sorted_level_of_interest
    Job.order(level_of_interest: :desc)
  end

  def self.count_all_levels_of_interest
    interests = Job.group(:level_of_interest).count.sort.to_h

    Job.normalize_interests(interests)
  end

  def self.normalize_interests(interests)
    stars = {}

    interests.each do |interest, count|
      interest_string = self.to_stars(interest).to_s

      stars[interest_string] = 0 if stars[interest_string].nil?
      stars[interest_string] += count
    end

    stars.keys.each do |key|
      stars[key.to_f] = stars.delete(key)
    end

    stars
  end

  def self.to_stars(interest)
    normalized = interest / 20.0
    whole_part = normalized.to_i
    partial = normalized - whole_part
    partial = 0.5 unless partial.zero?

    whole_part + partial
  end
end
