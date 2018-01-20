require 'rails_helper'

RSpec.describe Song, type: :model do

  describe "validations" do
      it "is invalid without name" do
        song = Song.new(name: "")
        song.valid?
        expect(song.errors).to have_key(:name)
      end
      it "is invalid without release date" do
        song = Song.new(release_date: "")
        song.valid?
        expect(song.errors).to have_key(:release_date)
      end
      it "is invalid without genre" do
        song = Song.new(genre: "")
        song.valid?
        expect(song.errors).to have_key(:genre)
      end
      it "is invalid without an artist" do
        song = Song.new
        song.valid?
        expect(song.errors).to have_key(:artist)
      end
    end

  describe "association with artist" do
    let(:artist) { create :artist }

    it "belongs to a artist" do
      song = artist.songs.build(name: "Disco")

      expect(song.artist).to eq(artist)
    end
  end
end
