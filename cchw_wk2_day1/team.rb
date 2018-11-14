class Team

  attr_reader :name, :players, :coach, :points
  attr_writer :coach

  def initialize(name, players, coach)
    @name = name
    @players = players
    @coach = coach
    @points = 0
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def check_player(player_to_check)
    for player in @players
      return true if (player == player_to_check)
    end
    return false
  end

  def add_match_result(result)
    @points += 3 if (result == "win")
  end
  
end
