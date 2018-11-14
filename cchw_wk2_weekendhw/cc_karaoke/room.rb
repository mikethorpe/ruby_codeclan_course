require_relative("guest")
require_relative("song")

class Room

  attr_reader :booth_name, :guests

  def initialize(booth_name, guests, max_guests, songs, entry_fee)
    @booth_name = booth_name
    @guests = guests
    @max_guests = max_guests
    @songs = songs
    @entry_fee = entry_fee
  end

#UNIT TEST FAILS HERE - test_check_in_guest_insufficient_funds
  # returns false if we can't add a guest
  def check_in_guest(guest)
    if (@guests.count < @max_guests)
      guest_paid = guest.pay_money(@entry_fee)
      @guests << guest if (guest_paid == true)
      return guest_paid
    end
    return false
  end

  def check_out_guest(guest_name)
    @guests.each{ |guest| @guests.delete(guest) if guest.name == guest_name }
  end

  def charge_entry(guest)
    guest.pay_money(@entry_fee)
  end
end
