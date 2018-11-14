require('pry-byebug')

require('pg')

class Bounty
  attr_reader :id, :name
  attr_writer :collected_by

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @collected_by = options['collected_by']
  end

  def save()
    # connect to db
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost'})

    # write sql command
    sql = "INSERT INTO bountys (name, bounty_value, collected_by)
    VALUES ($1, $2, $3) RETURNING *;"

    values = [@name, @bounty_value, @collected_by]

    # template
    db.prepare("save", sql)

    # execute
    hashes = db.exec_prepared("save", values)
    @id = hashes.first['id'].to_i

    # close
    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost'})
    sql = "UPDATE bountys SET (name, bounty_value, collected_by) = ($1, $2, $3)
      WHERE id = $4;"
    values = [@name, @bounty_value, @collected_by, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bountys WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def Bounty.find_by_name(name)
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM bountys WHERE name = $1;"
    values = [name]
    db.prepare("find_by_name", sql)
    hashes = db.exec_prepared("find_by_name", values)
    db.close()

    return Bounty.new(hashes.first)
  end

end
