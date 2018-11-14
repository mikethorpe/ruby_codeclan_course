require_relative('../db/sql_runner')
require_relative('film')

class Customer
    attr_accessor :name, :funds
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id'] != nil
        @name = options['name']
        @funds = options['funds'].to_i
    end

    def save()
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
        values = [@name, @funds]
        result = SqlRunner.run(sql, values)
        @id = result.first['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    def film_bookings()
        sql = "SELECT films.*
        FROM films
        INNER JOIN tickets
            ON tickets.film_id = films.id
        WHERE customer_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map {|film_hash| Film.new(film_hash)}
    end

    def update()
        sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    def spend_funds(cost)
        @funds -= cost
        self.update()
    end

    def number_of_tickets()
        sql = "SELECT * FROM tickets WHERE customer_id = $1"
        values = [@id]
        tickets = SqlRunner.run(sql, values)
        return tickets.count
    end

end