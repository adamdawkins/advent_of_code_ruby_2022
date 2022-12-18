class Day04
  INPUT_PATH = "inputs/04".freeze

  attr_reader :input

  def initialize
    @input = File.readlines(INPUT_PATH)
  end

  def part1
    nil
  end

  # rubocop:todo Metrics/AbcSize
  def part2 # rubocop:todo Metrics/CyclomaticComplexity, Metrics/AbcSize
    pairs = input.map(&:strip).count do |pair| # rubocop:todo Lint/UselessAssignment
      elf1, elf2 = pair.split(",").map { |elf| elf.match(/(\d*)-(\d*)/).captures.map(&:to_i) }
      (elf1.first >= elf2.first && elf1.last <= elf2.last) || (elf2.first >= elf1.first && elf2.last <= elf1.last)
    end
  end
  # rubocop:enable Metrics/AbcSize
end
