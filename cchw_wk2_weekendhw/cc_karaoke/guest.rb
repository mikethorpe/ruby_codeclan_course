class Guest

  attr_reader :name

  def initialize(name, money,favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def money()
    return @money
  end

  def pay_money(charge)
    if @money >= charge
      @money -= charge
    else
      return false
    end
    return true
  end


end
