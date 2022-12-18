class Day02
  INPUT_PATH = "inputs/02".freeze

  attr_reader :strategy

  def initialize
    @strategy = File.readlines(INPUT_PATH).map(&:split)
  end

  def part1 # rubocop:todo Metrics/MethodLength
    draw = 3
    win = 6

    selection_scores = strategy.sum do |round|
      case round
      in [_, "X"]
        1
      in [_, "Y"]
        2
      in [_, "Z"]
        3
      end
    end

    result_scores = strategy.sum do |round|
      case round
      in %w[A X]
        draw
      in %w[B Y]
        draw
      in %w[C Z]
        draw
      in %w[A Y]
        win
      in %w[B Z]
        win
      in %w[C X]
        win
      else
        0
      end
    end

    result_scores + selection_scores
  end

  # rubocop:todo Metrics/MethodLength
  def part2 # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    points = { rock: 1,
               paper: 2,
               scissors: 3,
               win: 6,
               draw: 3,
               lose: 0 }

    manual = strategy.sum do |round| # rubocop:todo Lint/UselessAssignment
      case round
      in ["A", "X"]
        points[:scissors] + points[:lose]
      in ["A", "Y"]
        points[:rock] + points[:draw]
      in ["A", "Z"]
        points[:paper] + points[:win]
      in ["B", "X"]
        points[:rock] + points[:lose]
      in ["B", "Y"]
        points[:paper] + points[:draw]
      in ["B", "Z"]
        points[:scissors] + points[:win]
      in ["C", "X"]
        points[:paper] + points[:lose]
      in ["C", "Y"]
        points[:scissors] + points[:draw]
      in ["C", "Z"]
        points[:rock] + points[:win]
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
