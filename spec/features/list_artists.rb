require 'rails_helper'


describe "Visitors can see a list of all the artists" do

  let(:artist1) { create :artist }
  let(:artist2) { create :artist }
  let(:artist3) { create :artist }

  it "shows all artists" do
    visit root_url

    expect(page).to have_text("All artists")
  end
end
