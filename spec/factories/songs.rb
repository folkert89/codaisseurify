FactoryBot.define do
  factory :song do
    # listing_name      { Faker::Lorem.words(3).join(' ') }
    name              { Faker::Lorem.words(2) }
    release_date      { Faker::Date.between(50.year.ago, 30.year.ago) }
    genre             { Faker::Lorem.words(1) }
    artist             { build(:artist) }
  end
end
