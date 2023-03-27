class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :director_id, presence: true
end
