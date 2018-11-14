require_relative('models/artist')
require_relative('models/album')

bob_dylan = Artist.new(
  {'name' => 'Bob Dylan'}
)
bob_dylan.save()

times = Album.new(
  {
    'title' => 'The Times They Are a-Changin',
    'genre' => 'folk',
    'artist_id' => bob_dylan.id
  }
)
times.save()

basement = Album.new(
  {
    'title' => 'The Basement Tapes',
    'genre' => 'folk',
    'artist_id' => bob_dylan.id
  }
)
basement.save()

p albums = Album.albums().length
p artist = Artist.artists().length

dead_sara = Artist.new(
  {'name' => 'Dead Sara'}
)
dead_sara.save()

dead_sara_album = Album.new(
  {
    'title' => 'Dead Sara',
    'genre' => 'Rock',
    'artist_id' => dead_sara.id
  }
)
dead_sara_album.save()

dead_sara.albums_by_artist().each { |album| p album.title }

p basement.album_artist().name
p times.album_artist().name
p dead_sara_album.album_artist().name
