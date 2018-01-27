class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :country_of_origin, :birth_date

  has_many :songs, dependent: :destroy
  has_one :photo, dependent: :destroy
end
