require("minitest/autorun")
require_relative("../team")

class TestTeam < MiniTest::Test

  def test_team_name
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal("The Lions", team1.name)
  end

  def test_players
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal(["Player 1"], team1.players)
  end

  def test_coach
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal("Coach Awesome", team1.coach)
  end

  def test_set_coach
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    team1.coach = "Giles"
    assert_equal("Giles", team1.coach)
  end

  def test_add_player
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    team1.add_player("Player 2")
    assert_equal(["Player 1", "Player 2"], team1.players)
  end

  def test_check_player_found
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal(true, team1.check_player("Player 1"))
  end

  def test_check_player_not_found
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal(false, team1.check_player("Gazza"))
  end

  def test_points
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    assert_equal(0, team1.points)
  end

  def test_win
    team1 = Team.new("The Lions", ["Player 1"], "Coach Awesome")
    team1.add_match_result("win")
    assert_equal(3, team1.points)
  end

end
