require_relative('../db/sql_runner')
require_relative('customer')
require_relative('screening')

class Film
    
    attr_accessor :id, :title, :price

    def initialize(options)
        @id = options['id'] if options['id'] != nil
        @title = options['title']
        @price = options['price'].to_i
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
        values = [@title, @price]
        result = SqlRunner.run(sql, values)
        @id = result.first['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM films"
        SqlRunner.run(sql)
    end

    def update()
        sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
        values = [@title, @price, @id]
        SqlRunner.run(sql, values)
    end

    def customers()
        sql = "SELECT customers.*
        FROM customers
        INNER JOIN tickets
            ON tickets.customer_id = customers.id
        WHERE film_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map {|film_hash| Customer.new(film_hash)}
    end

    def number_of_customers()
        sql = "SELECT * FROM tickets WHERE film_id = $1"
        values = [@id]
        tickets = SqlRunner.run(sql, values)
        return tickets.count
    end

    def screenings()
        sql = "SELECT * FROM screenings WHERE film_id = $1"
        values = [@id]
        screenings = SqlRunner.run(sql, values)
        return screenings.map {|screening_hash| Screening.new(screening_hash)}
    end

    def most_popular_screening()
        
        screenings = self.screenings()
        sql = "SELECT * FROM tickets WHERE screening_id = $1"
        
        most_popular_screening = nil
        most_sreening_tickets = 0

        for screening in screenings
            p screening.id
            values = [screening.id]
            screening_tickets = SqlRunner.run(sql, values).count
            most_popular_screening = screening if screening_tickets > most_sreening_tickets
        end
        
        return most_popular_screening
    end

    def all_tickets()
        sql = "SELECT tickets.*
        FROM tickets
        INNER JOIN screenings
        ON screenings.id = tickets.screening_id
        WHERE screenings.film_id = $1"
        values = [@id]
        # all of the tickets for a film
        tickets = SqlRunner.run(sql, values)
        return tickets.map {|ticket_hash| Ticket.new(ticket_hash)}
    end 
    



    def most_popular_time()
        tickets = self.all_tickets()

    end
end