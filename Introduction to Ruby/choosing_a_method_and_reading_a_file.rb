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
-1
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
-1
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

#Метод для выбора нужного метода
def methods(met_number, array)
  case met_number
    when 1
      puts "Минимальный элемент (for): #{min_element(array)}"
    when 2
      puts "Минимальный элемент (while): #{min_element_while(array)}"
    when 3
      puts "Номер первого положительного элемента (for): #{first_positive_for(array)}"
    when 4
      puts "Номер первого положительного элемента (while): #{first_positive_while(array)}"
    when 5
      puts "Количество элементов (for): #{count_elements_for(array)}"
    when 6
      puts "Количество элементов (while): #{count_elements_while(array)}"
    else 
      puts "Метод не найден"
  end
end

#Проверка количества аргументов
if ARGV.length != 2
  puts "Внимание! Необходимо указать 2 аргумента:
  Пример: ruby script.rb <met_number> <file_path>"
  exit
end

met_number = ARGV[0].to_i
filep = ARGV[1]
#Проверка на существование файла
begin
  array = File.readlines(filep).map(&:to_i)  
  methods(met_number, array)
rescue Errno::ENOENT
  puts "Файл не найден"
rescue ArgumentError
  puts "Ошибка чтения файла."
end
