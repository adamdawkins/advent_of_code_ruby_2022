class Day06
  INPUT_PATH = "inputs/06".freeze

  attr_reader :input

  def initialize
    @input = File.read(INPUT_PATH)
  end

  def part1
    nil
  end

  def part2
    StartOfMessageMarker.new(input).start
  end
end

class StartOfPacketMarker
  attr_reader :signal, :marker_length

  def initialize(signal)
    @signal = signal.chars
    @marker_length = 4
  end

  def start
    passed_letters = 0
    passed_letters += 1 until start_of_packet? signal.slice(passed_letters, marker_length)

    passed_letters + marker_length
  end

  def start_of_packet?(chars)
    chars.uniq.count == marker_length
  end
end

class StartOfMessageMarker < StartOfPacketMarker
  def initialize(signal)
    super
    @marker_length = 14
  end
end
