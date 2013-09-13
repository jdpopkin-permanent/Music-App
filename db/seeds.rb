# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b = Band.create(name: "Minor Threat")
a = Album.create(name: "Flex Your Head", band_id: b.id, live_or_studio: "studio")
t = Track.create(name: "In My Eyes", album_id: a.id,
  regular_or_bonus: "regular", lyrics: "you tell me")