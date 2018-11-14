require('minitest/autorun')
require_relative('../models/customer')

class TestCustomer < MiniTest::Test
    
    def setup
        @pawel = Customer.new(
            {
                'name' => 'pawel',
                'funds' => 100
            }
        )
    end

    def test_spend_money
        @pawel.spend_funds(20)
        expected = 80
        actual = @pawel.funds
        assert_equal(expected, actual)
    end

end