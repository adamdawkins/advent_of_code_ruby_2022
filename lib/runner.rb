# frozen_string_literal: true

Dir["./lib/days/*.rb"].sort.each { |f| require f }

class Runner
  class << self
    def run(klass)
      pp klass.to_s
      pp "-------------"
      pp "Part 01: #{klass.new.part1}"
      pp "Part 02: #{klass.new.part2}"
      pp "============="
    end
  end
end

Runner.run(Day07)
# Runner.run(Day06)
# Runner.run(Day05)
# Runner.run(Day04)
# Runner.run(Day03)
# Runner.run(Day02)
# Runner.run(Day01)
