class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :director, presence: true
end
