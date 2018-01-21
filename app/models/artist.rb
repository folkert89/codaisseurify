class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_one :photo
  
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :country_of_origin, presence: true
end
