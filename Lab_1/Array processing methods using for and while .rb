#Минимальный элемент(for)
def min_element_for(array)
  min = array[0]
  for i in 1...array.size
    if array[i] < min
      min = array[i]
    end
  end
  min
end
#Минимальный элемент(while)
def min_element_while(array)
  min = array[0]
  i = 1
  while i < array.size
    if array[i] < min
      min = array[i]
    end
    i += 1
  end
  min
end
#Первый положительный элемент(for)
def first_positive_for(array)
  for i in 0...array.size
    if array[i] > 0
      return i
    end
  end
-1 # Если нет положительных элементов
end
#Первый положительный элемент(while)
def first_positive_while(array)
  i = 0
  while i < array.size
    if array[i] > 0
      return i
    end
    i += 1
  end
-1 # Если нет положительных элементов
end
#Метод для подсчета количества элементов(for)
def count_elements_for(array)
  count = 0
  for _ in array
    count += 1
  end
  count
end
#Метод для подсчета количества элементов(while)
def count_elements_while(array)
  count = 0
  index = 0
  while index < array.length
    count += 1
    index += 1
  end
  count
end

array = [-3, -2, 1, 4, 5]

puts "Минимальный элемент (for): #{min_element(array)}"
puts "Минимальный элемент (while): #{min_element_while(array)}"
puts "Номер первого положительного элемента (for): #{first_positive(array)}"
puts "Номер первого положительного элемента (while): #{first_positive_while(array)}"
puts "Количество элементов (for): #{count_elements_for(array)}"
puts "Количество элементов (while): #{count_elements_while(array)}"
