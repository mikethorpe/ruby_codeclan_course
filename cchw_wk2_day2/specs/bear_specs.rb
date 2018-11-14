require("minitest/autorun")
require_relative("../bear")

class TestBear < MiniTest::Test

  def setup
    fish1 = Fish.new("Sharky")
    fish2 = Fish.new("George")
    @amazon = River.new("Amazon", [fish1, fish2])
    @paddington = Bear.new("Paddington", "Brown")
  end

  def test_food_count
    assert_equal(0, @paddington.food_count())
  end

  def test_take_fish
    @paddington.take_fish(@amazon)
    # The Bear has taken the fish from the river
    # We should now have 1 fish in both Bear and River
    assert_equal(1, @paddington.food_count())
    assert_equal(1, @amazon.fish_count())
  end

  def test_roar
    assert_equal("Rawwr!!", @paddington.roar())
  end

end
