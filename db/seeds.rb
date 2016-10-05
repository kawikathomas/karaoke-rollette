# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times {
  user = User.create!({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password",
      # facebook_id:
      # token:

      party_id: rand(1..2)
  })
}

5.times {
  user = User.create({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      # facebook_id:
      # token:
      party_id: nil
  })
}

2.times {
  party = Party.create({
      name: Faker::University.name
  })
}

num = 0

20.times {
  playlist = Playlist.create({
    user_id: num
  })
  num += 1
}

100.times {
  playlist_songs = PlaylistSong.create({
      playlist_id: rand(1..20),
      song_id: rand(1..100)
  })
}

100.times {
  song = Song.create({
      artist: Faker::GameOfThrones.character,
      title: Faker::Book.title
  })
}


