require_relative('../db/sql_runner')

class Screening

    attr_reader :id, :show_time

    def initialize(options)
        @id = options['id'].to_i if options['id'] != nil
        @film_id = options['film_id'].to_i
        @show_time = options['show_time']
    end

    def save()
        sql = "INSERT INTO screenings (film_id, show_time) VALUES ($1, $2) RETURNING id"
        values = [@film_id, @show_time]
        result = SqlRunner.run(sql, values)
        @id = result.first['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM screenings"
        SqlRunner.run(sql)
    end

end