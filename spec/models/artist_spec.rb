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
end
