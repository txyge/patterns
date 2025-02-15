require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\array\array_processing.rb'
require 'test/unit'

class TestCustomArrayProcessor < Test::Unit::TestCase
  def data
    @data = CustomArrayProcessor.new([1, 2, 3, 4, 5, 6, 4, 8, 5, 10])
    @data_additionally = CustomArrayProcessor.new([11, 12, 13, 14, 15])
  end
  def test_find
    assert_equal(5, @data.find { |i| i % 5 == 0 })
  end
  def test_min_by
    assert_equal(10, @data.min_by { |i| -i })
  end

  def test_inject
    assert_equal(48, @data.inject(0) { |sum, i| sum + i })
  end

  def test_one?
    assert_true(@data.one? { |i| i == 10 })
    assert_false(@data.one? { |i| i < 10 })
  end

  def test_flat_map
    assert_equal([11, 22, 12, 24, 13, 26, 14, 28, 15, 30], @data_additionally.flat_map { |i| [i, i * 2] })
  end
  
  def test_all?
    assert_true(@data.all? { |i| i < 11 })
    assert_false(@data.all? { |i| i < 10 })
  end
end
