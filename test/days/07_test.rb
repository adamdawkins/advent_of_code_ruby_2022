require "minitest/autorun"
require_relative "../../lib/days/07"

class TestFileNode < MiniTest::Test
  def setup
    @doc = Day07::FileNode.new(10, "foo")
  end

  def test_file_size_attr_exists
    assert_equal 10, @doc.file_size
  end

  def test_name_attr_exists
    assert_equal "foo", @doc.name
  end
end

class TestDirectory < MiniTest::Test
  def setup
    @directory = Day07::Directory.new("a", [Day07::Directory.new("e", [Day07::FileNode.new(584, "i")]),
                                            Day07::FileNode.new(29_116, "f"),
                                            Day07::FileNode.new(2557, "g"),
                                            Day07::FileNode.new(62_596, "h.lst")])
  end

  def test_name_attr_exists
    assert_equal "a", @directory.name
  end

  def test_file_size_returns_sum_of_all_file_sizes_and_child_dir_sizes
    assert_equal 94_853, @directory.file_size
  end
end
