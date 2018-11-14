require_relative('../db/sql_runner')
require_relative('customer')

class Ticket
    
    def initialize(options, customer)
        @id = options['id'] if options['id'] != nil
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
        @screening_id = options['screening_id'].to_i
        @customer = customer
    end

    def save()
        sql = "INSERT INTO tickets 
        (customer_id, film_id, screening_id) 
        VALUES ($1, $2, $3) 
        RETURNING id"
        values = [@customer_id, @film_id, @screening_id]
        result = SqlRunner.run(sql, values)
        @id = result.first['id'].to_i
        self.charge_for_film()
    end

    def self.delete_all()
        sql = "DELETE FROM tickets"
        SqlRunner.run(sql)
    end
    
    def charge_for_film()
        sql = "SELECT price FROM films WHERE id = $1"
        values = [@film_id]
        result = SqlRunner.run(sql, values)
        film_price = result.first['price'].to_i
        @customer.spend_funds(film_price)
    end


end