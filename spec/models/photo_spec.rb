require 'rails_helper'

RSpec.describe Photo, type: :model do

    describe "association with artist" do
      let(:artist) { create :artist }
      let!(:photo) { create :photo, artist: artist }
      it "belongs to a artist" do
        # photo = artist.photo.build(:photo, artist: artist)

        expect(photo.artist).to eq(artist)
      end
    end
end
