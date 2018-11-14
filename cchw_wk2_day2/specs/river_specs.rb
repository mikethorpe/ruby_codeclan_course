require("minitest/autorun")
require_relative("../river")

class TestRiver < MiniTest::Test

  def setup
    fish1 = Fish.new("Sharky")
    fish2 = Fish.new("George")
    @amazon = River.new("Amazon", [fish1, fish2])
  end

  def test_fish_count
    assert_equal(2, @amazon.fish_count())
  end

  def test_lose_fish
    @amazon.lose_fish()
    assert_equal(1, @amazon.fish_count())
  end

  def test_lose_fish_returns_fish
    @amazon.lose_fish()
    assert_equal(Fish, @amazon.lose_fish.class())
  end

end
