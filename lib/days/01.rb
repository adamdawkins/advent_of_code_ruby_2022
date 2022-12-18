class Day01
  INPUT_PATH = "inputs/01".freeze

  attr_reader :input

  def initialize
    @input = File.open(INPUT_PATH).read.split(/\n\n/)
  end

  def part1
    input.map { |elf| elf.split(/\n/).map(&:to_i).sum }.max
  end

  def part2
    input.map { |elf| elf.split(/\n/).map(&:to_i).sum }.max(3).sum
  end
end
