require "minitest/autorun"
require_relative "../../lib/days/05"

class TestTopCrates < MiniTest::Test
  def setup
    crates = { "1" => %w[N Z], "2" => %w[D C M], "3" => %w[P] }
    instructions = [{ "move" =>  "1", "from" =>  "2", "to" =>  "1" },
                    { "move" =>  "3", "from" =>  "1", "to" =>  "3" },
                    { "move" =>  "2", "from" =>  "2", "to" =>  "1" },
                    { "move" =>  "1", "from" =>  "1", "to" =>  "2" }]

    @top_crates = TopCrates.new(crates, instructions)
  end

  def test_that_the_top_crates_are_returned
    assert_equal "CMZ", @top_crates.output
  end
end

# class TestCrateInstructionParser < MiniTest::Test
#   def setup
#     @expected = [{"move" =>  "1", "from" =>  "2", "to" =>  "1"},
#                  {"move" =>  "3", "from" =>  "1", "to" =>  "3"},
#                  {"move" =>  "2", "from" =>  "2", "to" =>  "1"},
#                  {"move" =>  "1", "from" =>  "1", "to" =>  "2"}]
#   end

#   def test_that_output_matches_hash_of_moves
#     assert_equal @expected, CrateInstructionParser.parse("../../examples/05")
#   end
# end

# class TestCrateInstructionParserPart2 < MiniTest::Test
#   def setup
#     @expected = [{"move" =>  "1", "from" =>  "2", "to" =>  "1"},
#                  {"move" =>  "3", "from" =>  "1", "to" =>  "3"},
#                  {"move" =>  "2", "from" =>  "2", "to" =>  "1"},
#                  {"move" =>  "1", "from" =>  "1", "to" =>  "2"}]
#   end

#   def test_that_output_matches_hash_of_moves
#     assert_equal @expected, CrateInstructionParserPart2.parse("../../examples/05")
#   end
# end
