class DataList
  def initialize(objects)
    @objects = objects
    @selected = []
  end

  def select(number)
    @selected << number unless @selected.include?(number)

    def get_selected
      @selected.map { |number| @objects[number] }
    end

    def get_names
      raise "Метод get_names должен быть реализован в наследниках" 
    end

    def get_data
      raise "Метод get_data должен быть реализован в наследниках"
    end
  end
