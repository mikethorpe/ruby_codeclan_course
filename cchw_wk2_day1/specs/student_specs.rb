require("minitest/autorun")
require_relative("../student")

class TestStudent < MiniTest::Test

  def test_name
    student1 = Student.new("Jim", "E90")
    assert_equal("Jim", student1.name())
  end

  def test_cohort
    student1 = Student.new("Jim", "E90")
    assert_equal("E90", student1.cohort())
  end

  def test_set_name
    student1 = Student.new("Jim", "E90")
    student1.set_name("Matt")
    assert_equal("Matt", student1.name())
  end

  def test_set_cohort
    student1 = Student.new("Jim", "E90")
    student1.set_cohort("E100")
    assert_equal("E100", student1.cohort())
  end

  def test_can_talk
    student1 = Student.new("Jim", "E90")
    assert_equal("I can talk", student1.talk())
  end

  def test_say_favourite_language
    student1 = Student.new("Jim", "E90")
    expected = "My favourite language is Esperanto"
    actual = student1.say_favourite_language("Esperanto")
    assert_equal(expected, actual)
  end

end
