Song.destroy_all
Photo.destroy_all
Artist.destroy_all

paul_mc_cartney = Artist.create!(name: "Paul McCartney", birth_date: "06/11/1942", country_of_origin: "United Kingdom")
queen = Artist.create!(name: "Freddie Mercury", birth_date: "09/05/1946", country_of_origin: "United Kingdom")
barry_hay = Artist.create!(name: "Barry Hay", birth_date: "08/10/1948", country_of_origin: "The Netherlands")

Song.create!([{name: "Another one bites the dust",
                  release_date: "03/10/1960",
                  genre: "Rock",
                  artist: queen},
                  {name: "We are the champions",
                  release_date: "03/11/1963",
                  genre: "Rock",
                  artist: queen},
                  {name: "Hey Jude",
                  release_date: "01/07/1960",
                  genre: "Pop",
                  artist: paul_mc_cartney},
                  {name: "Let it be",
                  release_date: "03/10/1965",
                  genre: "Rock",
                  artist: paul_mc_cartney},
                  {name: "Radar Love",
                  release_date: "03/10/1964",
                  genre: "Rock",
                  artist: barry_hay},
                  {name: "When the lady smiles",
                  release_date: "03/10/19670",
                  genre: "Rock",
                  artist: barry_hay}])

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/folkert89/image/upload/v1516533882/paul.jpg", artist: paul_mc_cartney)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/folkert89/image/upload/v1516533947/queen.jpg", artist: queen)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/folkert89/image/upload/c_scale,w_1065/v1516533995/barry.jpg", artist: barry_hay)
