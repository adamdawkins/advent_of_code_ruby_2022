class Day03
  INPUT_PATH = "inputs/03".freeze

  attr_reader :input

  def initialize
    @input = File.readlines(INPUT_PATH)
  end

  def part1
    backpacks = input.map(&:strip).map { |backpack| halve(backpack) }
    backpacks.map { |backpack| duplicated_item(*backpack) }.sum { |item| priority(item) }
  end

  def part2
    nil
  end

  private

  def halve(string)
    string.chars.each_slice(string.size / 2).map(&:join)
  end

  def duplicated_item(slot1, slot2)
    (slot1.chars & slot2.chars).first
  end

  def priority(char)
    if char < "a"
      char.ord - 38
    else
      char.ord - 96
    end
  end
end
