require "minitest/autorun"
require_relative "../../lib/days/06"

class TestStartOfPacketMarker < MiniTest::Test
  def test_that_output_returns_the_correct_number_of_characters
    assert_equal 7, StartOfPacketMarker.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").start
    assert_equal 5, StartOfPacketMarker.new("bvwbjplbgvbhsrlpgdmjqwftvncz").start
    assert_equal 6, StartOfPacketMarker.new("nppdvjthqldpwncqszvftbrmjlhg").start
    assert_equal 10, StartOfPacketMarker.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").start
    assert_equal 11, StartOfPacketMarker.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").start
  end
end

class TestStartOfMessageMarker < MiniTest::Test
  def test_that_output_returns_the_correct_number_of_characters
    assert_equal 19, StartOfMessageMarker.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").start
    assert_equal 23, StartOfMessageMarker.new("bvwbjplbgvbhsrlpgdmjqwftvncz").start
    assert_equal 23, StartOfMessageMarker.new("nppdvjthqldpwncqszvftbrmjlhg").start
    assert_equal 29, StartOfMessageMarker.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").start
    assert_equal 26, StartOfMessageMarker.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").start
  end
end
