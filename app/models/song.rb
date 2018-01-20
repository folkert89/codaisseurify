class Song < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true
  validates :genre, presence: true
  validates :release_date, presence: true
end
