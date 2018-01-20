require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "is invalid without name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
    it "is invalid without release date" do
      artist = Artist.new(birth_date: "")
      artist.valid?
      expect(artist.errors).to have_key(:birth_date)
    end
    it "is invalid without genre" do
      artist = Artist.new(country_of_origin: "")
      artist.valid?
      expect(artist.errors).to have_key(:country_of_origin)
    end
  end
  describe "association with song" do
    let(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
      song1 = artist.songs.new(name: "Lalaland")
      song2 = artist.songs.new(name: "Splish splash i was taking a bath")

      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-1)
    end
  end
end
