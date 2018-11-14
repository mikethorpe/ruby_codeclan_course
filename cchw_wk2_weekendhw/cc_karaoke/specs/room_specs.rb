require("minitest/autorun")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    final_countdown = Song.new("Final Countdown", "Europe")
    one_and_only = Song.new("The one and only", "Chesney Hawkes")
    cheesey_songs = [final_countdown, one_and_only]
    mrjones = Guest.new("Mr Jones", 100, "Final Countdown")
    @mrsjones = Guest.new("Mrs Jones", 200, "Final Countdown")
    @guests = [mrjones]
    @room = Room.new("CheeseBunker", @guests, 2, cheesey_songs, 10)
  end


  def test_booth_name
    assert_equal("CheeseBunker", @room.booth_name)
  end

  def test_guests
    expected = [Guest.new("Mr Jones", 200, "Final Countdown")]
    assert_equal(@guests, @room.guests)
  end

  def test_check_in_guest
    check_in_success = @room.check_in_guest(@mrsjones)
    assert_equal(2, @room.guests.length)
    assert_equal(true, check_in_success)
  end

  def test_check_in_guest_room_full
    jones_jr = Guest.new("Mr Jones Jr.", 20, "Final Countdown")
    # room full - 2 guests
    @room.check_in_guest(@mrsjones)
    # try to check in one too many guests
    check_in_fail = @room.check_in_guest(jones_jr)
    # ensure we dont't add the extra guest
    assert_equal(2, @room.guests.length)
    # check we return false when we can't add a guest
    assert_equal(false, check_in_fail)

  end

  def test_check_in_guest_insufficient_funds
    @jones_jr = Guest.new("Mr Jones Jr.", 5, "Final Countdown")
    check_in_fail = @room.check_in_guest(@jones_jr)
    # check the guest does not get checked in when they have
    # insufficient funds
    assert_equal(1, @room.guests.length)
    # check guest does not pay when they have insufficient
    # funds to check into the room
    assert_equal(5, @jones_jr.money())
    #check we return false when check in fails
    assert_equal(false, check_in_fail)
  end

  def test_check_out_guest
    @room.check_out_guest("Mr Jones")
    assert_equal(0, @room.guests.length)
  end

  def test_charge_entry_guest_sufficient_funds
    @room.charge_entry(@mrsjones)
    assert_equal(190, @mrsjones.money())
  end

  def test_charge_entry_guest_insufficient_funds
    @jones_jr = Guest.new("Mr Jones Jr.", 5, "Final Countdown")
    @room.charge_entry(@jones_jr)
    assert_equal(5, @jones_jr.money())
  end


end
