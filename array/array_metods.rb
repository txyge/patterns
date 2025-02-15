#Задача 1. Дан целочисленный массив,
#в котором лишь один элемент отличается от остальных.
#Необходимо найти значение этого элемента.

def find_unique(array)
  array.detect { |element| array.count(element) == 1 }
end

#Задача 2. Дан целочисленный массив.
# Необходимо найти два наименьших элемента.

def find_two_smallest(arr)
  arr.min(2)
end

#Задача 3. Дано вещественное число R и массив вещественных чисел.
# Найти элемент массива, который наиболее близок к данному числу.

def find_closest(array, number)
  array.min_by { |element| (element - number).abs }
end

#Задача 4. Для введенного списка положительных чисел построить
# список всех положительных делителей элементов списка без повторений.

def find_divisors(array)
  array.map { |element| (1..element).select { |element_in| element % element_in == 0 } }.flatten.uniq.join(", ")
end

#Задача 5. Дан список. Построить новый список из квадратов неотрицательных
# чисел, меньших 100 и встречающихся в массиве больше 2 раз.

def find_squares_of_repeated(array)
 new_array =  array.select { |element| element > 0 && element < 100 }.select { |element| array.count(element) > 2 }.map { |element| element * element }
 new_array.uniq.join(", ")
end

def array_from_file(filename)
  File.readlines(filename).map(&:to_i)
end

def array_from_keyboard
  puts "Введите числа, разделенные пробелом:"
  gets.chomp.split.map(&:to_i)
end

def main
  puts "Cпособ ввода данных:"
  puts "1. Чтение из файла"
  puts "2. Ввод с клавиатуры"
  selection = gets.chomp.to_i

  array = []
  if selection == 1
    puts "Введите имя файла:"
    filename = gets.chomp
    array = array_from_file(filename)
  elsif selection == 2
    array = array_from_keyboard
  else
    puts "Неверный выбор."
    return
  end

  puts "Выберите задачу:"
  puts "1. Найти значение элемента, отличающегося от остальных в целочисленном массиве."
  puts "2. Найти два наименьших элемента в целочисленном массиве."
  puts "3. Найти элемент массива, наиболее близкий к заданному вещественному числу R."
  puts "4. Построить список всех положительных делителей элементов списка положительных чисел без повторений."
  puts "5. Построить новый список из квадратов неотрицательных чисел, меньших 100 и встречающихся в массиве больше 2 раз."
  task_number = gets.chomp.to_i

  case task_number
  when 1
    array_unique_element = find_unique(array)
    puts "Значение элемента, отличающегося от остальных в массиве: #{array_unique_element}"
  when 2
    array_two_smallest = find_two_smallest(array)
    puts "Два наименьших элемента в массиве: #{array_two_smallest}"
  when 3
    puts "Введите вещественное число R:"
    r = gets.chomp.to_f
    array_closest = find_closest(array, r)
    puts " Элемент массива, наиболее близкий к числу #{r}: #{array_closesе}"
  when 4
    array_divisors = find_divisors(array)
    puts "Список всех положительных делителей элементов списка без повторений: #{array_divisors}"
  when 5
    array_squares = find_squares_of_repeated(array)
    puts "Новый список из квадратов неотрицательных чисел, меньших 100 и встречающихся в массиве больше 2-ух раз: #{array_squares}"
  else
    puts "Неверный выбор задачи."
  end
end

main()