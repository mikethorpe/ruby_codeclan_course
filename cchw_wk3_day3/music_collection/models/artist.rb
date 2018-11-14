require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'] if options['id'] != nil
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.artists()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return artists = result.map { |artist_hash| Artist.new(artist_hash) }
  end

  def albums_by_artist
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return albums = result.map { |album_hash| Album.new(album_hash) }
  end

end
