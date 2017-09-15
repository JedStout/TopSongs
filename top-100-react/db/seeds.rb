# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


genre = ['rap', 'hip-hop', 'r&b', 'old-school', 'dubstep', 'reggae']

100.times do
    Song.create(
        title: Faker::Pokemon.move,
        artist: Faker::Superhero.name,
        rank: Faker::Number.between(1, 100),
        genre: genre.sample()
    )
end

puts "Created #{Song.count} songs"