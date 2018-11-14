class Library

  def initialize()
    @books = [
      {
        title: "lord_of_the_rings",
        rental_details: {
          student_name: "Jeff",
          date: "01/12/16"
        }
      },
      {
        title: "lord_of_the_flies",
        rental_details: {
          student_name: "Barry",
          date: "01/11/16"
        }
      },

      {
        title: "do_androids_dream_of_electric_sheep",
        rental_details: {
          student_name: "Kate",
          date: "01/04/16"
        }
      }

    ]

  end

  def books()
    return @books
  end

  def get_book_info(book_title)
    for book in @books
      return book if book[:title] == book_title
    end
  end

  def get_book_rental_info(book_title)
    for book in @books
      return book[:rental_details] if book[:title] == book_title
    end
  end

  def add_book(new_book)
    @books.push(new_book)
  end

  def update_rental_details(book_title, student, due_date)
    for book in @books
      if (book[:title] == book_title)
        book[:rental_details][:student_name] = student
        book[:rental_details][:date] = due_date
      end
    end
  end
end
