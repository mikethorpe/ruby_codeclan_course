require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/screening')

# Clean up the database before each run
Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()

bladerunner = Film.new(
    {
       "title" => "Bladerunner", 
       "price" => 5
    } 
)
bladerunner.save()

bladerunner_screening = Screening.new(
    {
        "film_id" => bladerunner.id,
        "show_time" => "8:00"
    }
)
bladerunner_screening.save()

p bladerunner_screening.id

jim = Customer.new(
    {
        "name" => "Jim",
        "funds" => 40
    }
)
jim.save()

jims_bladerunner_ticket = Ticket.new(
    {
        "customer_id" => jim.id,
        "film_id" => bladerunner.id,
        "screening_id" => bladerunner_screening.id
    },
    jim
)
jims_bladerunner_ticket.save()

legally_blonde = Film.new(
    {
        "title" => "Legally Blonde", 
        "price" => 7
    } 
 )
 legally_blonde.save()

 legally_blonde_screening1 = Screening.new (
     {
         "film_id" => legally_blonde.id,
         "show_time" => "10:00"
     }
 )
 legally_blonde_screening1.save()


jims_legally_blonde_ticket = Ticket.new(
    {
        "customer_id" => jim.id,
        "film_id" => legally_blonde.id,
        "screening_id" => legally_blonde_screening1.id
    },
    jim
)
jims_legally_blonde_ticket.save()



legally_blonde_screening2 = Screening.new (
    {
        "film_id" => legally_blonde.id,
        "show_time" => "11:00"
    }
)
legally_blonde_screening2.save()


p legally_blonde.most_popular_screening().show_time
# jims_legally_blonde_rewatch_ticket = Ticket.new(
#     {
#         "customer_id" => jim.id,
#         "film_id" => legally_blonde.id
#     },
#     jim
# )
# jims_legally_blonde_rewatch_ticket.save()


# p jim.funds

# p jim.number_of_tickets

# p legally_blonde.number_of_customers()

# jim.name = "karen"
# jim.funds = 130
# jim.update()

# bladerunner.title = "Bladerunner 2"
# bladerunner.price = 25
# bladerunner.update()

# p jim.film_bookings()

# p bladerunner.customers()


