require("minitest/autorun")
require_relative("../song")

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("SuperSong!", "SuperGroup")
  end

  def test_name
    assert_equal("SuperSong!", @song.name)
  end

  def test_artist
    assert_equal("SuperGroup", @song.artist)
  end

end
