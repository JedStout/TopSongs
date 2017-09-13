# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    Song.create(
        title: Faker::Pokemon.move,
        artist: Faker::Superhero.name,
        rank: [1..100].sample,
        genre: Faker::Lovecraft.word
    )
end

puts "Created #{Song.count} songs"