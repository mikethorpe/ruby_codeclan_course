require("minitest/autorun")
require_relative("../library")

class TestLibrary < MiniTest::Test

  def setup
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

  def test_books
    library1 = Library.new()
    assert_equal(@books, library1.books())
  end

  def test_get_book_info
    library1 = Library.new()
    assert_equal(@books[1],library1.get_book_info("lord_of_the_flies"))
  end

  def test_get_book_rental_info
    library1 = Library.new()
    expected = @books[0][:rental_details]
    actual = library1.get_book_rental_info("lord_of_the_rings")
    assert_equal(expected, actual)
  end

  def test_add_book

    new_book = {
      title: "lord_of_the_blobs",
      rental_details: {
        student_name: "",
        date: ""
      }
    }

    library1 = Library.new()
    library1.add_book(new_book)
    assert_equal(4, library1.books.count)
  end

  def test_update_rental_details
    book_name = "do_androids_dream_of_electric_sheep"
    details = {
      student_name: "Jimmy",
      date: "01/05/16"
    }

    library1 = Library.new()
    library1.update_rental_details(book_name, "Jimmy", "01/05/16")
    assert_equal(details, library1.get_book_rental_info(book_name))
  end

end
