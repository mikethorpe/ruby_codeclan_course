require("minitest/autorun")
require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Mr Jones", 50, "Final Countdown")
  end

  def test_name
    assert_equal("Mr Jones", @guest.name)
  end

  def test_money
    assert_equal(50, @guest.money())
  end

  def test_pay_money_sufficient_funds
    sufficient_funds = @guest.pay_money(10)
    assert_equal(40, @guest.money)
    #check we return true if we pay money
    assert_equal(true, sufficient_funds)
  end

  def test_pay_money_insufficient_funds
    insufficient_funds = @guest.pay_money(60)
    # check we don't pay money if we have insufficient funds
    assert_equal(50, @guest.money)
    # check we reuturn true if we have insufficient funds
    assert_equal(false, insufficient_funds)
  end

end
