require_relative('../db/sql_runner')

class Album

  attr_reader :title

  def initialize(options)
    @id = options['id'] if options['id'] != nil
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING *"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.albums()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return albums = result.map { |album_hash| Album.new(album_hash) }
  end

  def album_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.new(result.first)
  end

end
