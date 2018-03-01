# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create({
    title: 'the hospital',
    user_watched: 'Yes',
    comments: "test",
    rating: 3,
    director_id: 1,
    genre_id: 3
})


Genre.create({
  name: "oil",
  movie_id: [1, 4, 5]
  })