class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :release_date, :genre

  belongs_to :artist
end
