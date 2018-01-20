FactoryBot.define do
  factory :artist do
    name              { Faker::Lorem.words(1) }
    country_of_origin { Faker::Address.country }
    birth_date        { Faker::Date.between(50.year.ago, 30.year.ago) }
  end
end
