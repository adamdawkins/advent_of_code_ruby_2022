class Day05
  INPUT_PATH = "inputs/05".freeze

  attr_reader :instructions

  def initialize
    @instructions = CrateInstructionParser.parse(INPUT_PATH)
  end

  def part1
    TopCrates.new(real_crates, instructions).output
  end

  def part2
    TopCratesPart2.new(real_crates, instructions).output
  end

  private

  def real_crates
    #     [M]             [Z]     [V]
    #     [Z]     [P]     [L]     [Z] [J]
    # [S] [D]     [W]     [W]     [H] [Q]
    # [P] [V] [N] [D]     [P]     [C] [V]
    # [H] [B] [J] [V] [B] [M]     [N] [P]
    # [V] [F] [L] [Z] [C] [S] [P] [S] [G]
    # [F] [J] [M] [G] [R] [R] [H] [R] [L]
    # [G] [G] [G] [N] [V] [V] [T] [Q] [F]
    #  1   2   3   4   5   6   7   8   9
    { "1" => %w[S P H V F G],
      "2" => %w[M Z D V B F J G],
      "3" => %w[N J L M G],
      "4" => %w[P W D V Z G N],
      "5" => %w[B C R V],
      "6" => %w[Z L W P M S R V],
      "7" => %w[P H T],
      "8" => %w[V Z H C N S R Q],
      "9" => %w[J Q V P G L F] }
  end
end

class TopCrates
  attr_reader :crates, :instructions

  def initialize(crates, instructions)
    @crates = crates
    @instructions = instructions
    process_instructions!
  end

  def output
    @crates.values.map(&:first).join
  end

  private

  def process_instructions!
    instructions.each { |instruction| process_instruction(instruction) }
  end

  def process_instruction(instruction)
    items = lift_items(instruction["move"].to_i, instruction["from"])
    drop_items(items, instruction["to"])
  end

  def lift_items(move, from)
    crates[from].shift(move)
  end

  def drop_items(items, to)
    items.each do |item|
      crates[to].unshift(item)
    end
  end
end

class TopCratesPart2 < TopCrates
  def drop_items(items, to)
    crates[to].unshift(items)
    crates[to].flatten!
  end
end

class CrateInstructionParser
  def self.parse(filename)
    File.readlines(filename, "\n\n").last.split("\n").map do |line|
      line.match(/move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/).named_captures
    end
  end
end
