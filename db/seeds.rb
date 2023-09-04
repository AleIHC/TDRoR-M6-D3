# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



CcUser.create(email: "mymail@mail.com", password: "mypassword", name: "Jon Doe", role: 1)

20.times do
    CcPost.create!([
      { cc_user_id: 1, image: "randomcat#{Random.new.rand(1..10)}.jpg", title:  Faker::Lorem.sentence(word_count: 3, supplemental: true), content: Faker::Lorem.paragraph_by_chars(number: 1024, supplemental: true)  }
    ])
end