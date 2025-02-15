class DataTable
  def initialize(data)
    @data = data
  end

  def get_elements(column, row)
    raise "неверные индексы" unless row < row_count && column < column_count
    @data[row][column]
  end

  def row_count
    @data.size
  end

  def column_count
    @data[0].size
  end

end
