require_relative("river")
require_relative("fish")

class Bear

  def initialize(name, type)
    @name = name
    @type = type
    @stomach = []
  end

  def food_count
    return @stomach.count
  end

  def take_fish(river)
    @stomach << river.lose_fish()
  end

  def roar()
    return "Rawwr!!"
  end
end
