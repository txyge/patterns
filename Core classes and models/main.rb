require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'
require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'
require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student_short.rb'

def write_to_txt(file_path, file_name, students)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(File.dirname(file_path))
    Dir.mkdir(File.dirname(file_path)) unless Dir.exist?(File.dirname(file_path))
    File.open("#{file_path}/#{file_name}.txt", 'w') do |file|
      students.each do |student|
        file.puts student.to_s
      end
    end
  
    puts "Данные успешно записаны в файл: #{file_path}/#{file_name}"
end 

def read_from_txt(file_path)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(file_path)
  
    students = []
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        students << Student.parsing(line.strip)
      end
    end
    students
end
    
# Создание объектов
student1 = Student.new(
  surname: 'Иванов',
  first_name: 'Иван',
  last_name: 'Иванович',
  id: "1",
  telegram: '@vinchik',
  git: "https://github.com/vinchik/kashka.git"
)

student2 = Student.new(
  surname: 'петров',
  first_name: 'петр',
  last_name: 'петрович',
  id: "2",
  phone: '+79999999999',
  email: 'Gk7cA@example.com'
)

student3 = Student.new(
  surname: 'ivanov',
  first_name: 'ivan',
  last_name: 'ivanovich',
  id: "3",
  telegram: '@ivanov',
  phone: '+79999999999',
  email: 'petrov@example.com'
)

# Вывод информации о студентах
puts student1.getinfo
puts "\n"
puts student2.getinfo
puts "\n"
puts student3.getinfo

puts "Студент 1 валиден? #{student1.validate?}"
puts "\n"
puts "Студент 2 валиден? #{student2.validate?}"
puts "\n"
puts "Студент 3 валиден? #{student3.validate?}"

# Создаем несколько студентов
students = [
  Student.parsing('ID: 1, Фамилия: Иванов, Имя: Иван, Отчество: Иванович, Телефон: +79162345678, Телеграм: @ivanov, Почта: ivanov@gmail.com, Гит: https://github.com/ivanov/repo.git'),
  Student.parsing('ID: 2, Фамилия: ivanov, Имя: ivan, Отчество: ivаnovich, Телефон: +98765432101, Телеграм: @ivanovik, Почта: neivanov@gmail.com, Гит: https://github.com/neivanov/repo.git'),
  Student.parsing('ID: 3, Фамилия: сидоров, Имя: сидро, Отчество: sidoroвич, Телефон: +98234568795, Телеграм: @sdrochuk, Почта: sadro@gmail.com, Гит: https://github.com/sidro/repo.git'),
]

# Записываем студентов в файл
write_to_txt('C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models', 'list', students)

# Чтение студентов из файла и вывод информации о них
read_from_txt('C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\list.txt').each do |student|
  puts student.getinfo
end

# Создаем экземпляры Student_short
student1_short = Student_short.new(students[0])
student2_short = Student_short.new(students[1])
student3_short = Student_short.new(students[2])

# Выводим информацию о студентах
puts student1_short.to_s
puts student2_short.to_s
puts student3_short.to_s