class CustomArrayProcessor
  def initialize(array)
    @array = array
  end

  def find(&block)
    @array.each do |element|
      return element if yield(element)
    end
    nil
  end

  def min_by(&block)  
    min_element = nil
    min_value = nil
    @array.each do |element|
      value = yield(element)
      if min_value.nil? || value < min_value
        min_element = element
        min_value = value
      end
    end
    min_element
  end

  def inject(initial_value, &block)
    result = initial_value
    @array.each do |element|
      result = yield(result, element)
    end
    result
  end

  def one?(&block)
    count = 0
    @array.each do |element|
      count += 1 if yield(element)
      return false if count > 1
    end
    count == 1
  end

  def flat_map(&block)
    result = []
    @array.each do |element|
      result.concat(yield(element))
    end
    result
  end

  def all?(&block)
    @array.each do |element|
      return false unless yield(element)
    end
    true
  end

  def to_a
    @array
  end
end