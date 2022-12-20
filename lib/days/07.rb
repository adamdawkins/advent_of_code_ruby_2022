class Day07
  INPUT_PATH = "inputs/07".freeze

  attr_accessor :input, :tree

  def initialize
    @input = File.readlines(INPUT_PATH)
    @tree = parse
  end

  FileNode = Struct.new(:file_size, :name)

  Directory = Struct.new(:name, :parent, :dirs, :files) do
    def total_size
      files.map(&:file_size).sum + dirs.map(&:total_size).sum
    end

    def flatten
      [dirs.map(&:flatten)].flatten + [self]
    end
  end

  def part1
    tree.flatten.select do |dir|
      dir.total_size <= 100_000
    end.sum(&:total_size)
  end

  def part2
  end

  private

  def parse
    root = Directory.new("/", nil, [], [])
    current = root

    input.each do |line|
      case command(line)
      in [:root, _]
        current = root
      in [:up, _]
        current = current.parent
      in [:dir, data]
        current.dirs.push(Directory.new(data[:dir_name], current, [], []))
      in [:file, data]
        current.files.push(FileNode.new(data[:size].to_i, data[:name]))
      in [:down, data]
        current = current.dirs.find { |dir| dir.name == data[:dir_name] }
      else
      end
    end

    root
  end


  def command(line)
    if (match_data = line.match(/.*cd \.\./))
      [:up, match_data]
    elsif (match_data = line.match(%r{cd (?<dir_name>[\w|/]*)\n}))
      return [:root, match_data] if match_data[:dir_name] == "/"

      [:down, match_data]
    elsif (match_data = line.match(/^dir (?<dir_name>.*)\n/))
      [:dir, match_data]
    elsif (match_data = line.match(/^(?<size>\d*) (?<name>.*)\n/))
      [:file, match_data]
    else
      [:ls, nil]
    end
  end
end
