class Movie < ApplicationRecord
  has_many :reviews
  has_one_attached :image

  def self.all_release_dates
    order(release_date: :desc).pluck(:release_date).uniq
  end
def average_rating
  reviews.average(:ratings).to_f.round(1)
end
end
