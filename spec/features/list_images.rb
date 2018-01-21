require 'rails_helper'


describe "Visitors can view an artist's image" do

  it "shows artist's image" do
    visit root_url

    expect(page).to have_content("#{Artist.all.first.photo.image}")
  end
end
