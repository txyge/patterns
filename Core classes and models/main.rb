require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'
require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'
require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student_short.rb'

student1 = Student.new(last_name: "Иванов", first_name: "Иван",surname: "Сергеевич", phone: "+79991234567", telegram: "@ivanov", mail: "ivanov@example.com")
student2 = Student.new(id: "2", last_name: "Петров", first_name: "Петр", surname: "Сергеевич", phone: "+71234567890", telegram: "@petrov", mail: "petrov@example.com", git: "https://github.com/Bagdad1/repo.git")
student3 = Student.from_string("3, Иванов, Иван, Иванович, +7 (999) 123-45-67, @ivanov, ivanov@example.com,  https://github.com/Bagdad1/repo.git")
puts student1.get_info
puts student2.to_s
puts "\nСтудент 3 валиден? #{student3.validate?}"



def save_students_to_file(directory, filename, student_list)
  unless Dir.exist?(directory)
    Dir.mkdir(directory)
  end
  
  file_path = File.join(directory, "#{filename}.txt")
  File.open(file_path, 'w') do |file|
    student_list.each do |student|
      file.puts student.to_s
    end
  end
end

def load_students_from_file(file_path)
  raise ArgumentError, "Файл не найден: #{file_path}" unless File.exist?(file_path)

  student_list = []
  File.foreach(file_path) do |line|
    student_list << Student.from_string(line.strip)
  end

  student_list
end

  students = [
  Student.from_string('1, Иванов, Иван, Иванович, +7 (999) 123-45-67, @ivanov, ivanov@example.com,  https://github.com/Bagdad1/repo.git'),
  Student.from_string('2, Иванов, Иван, Иванович, +7 (999) 123-45-67, @ivanov, ivanov@example.com,  https://github.com/Bagdad1/repo.git'),
]

# Записываем студентов в файл
save_students_to_file('C:\Users\slast\OneDrive\Рабочий стол', 'data', students)

# Чтение студентов из файла и вывод информации о них
load_students_from_file('C:\Users\slast\OneDrive\Рабочий стол').each do |student|
  puts student.get_info
end

student_short = Student_short.create_from_student(students[0])

puts student1_short.to_s
puts "\n"
student2_short = Student_short.create_from_string(students[0].get_info)
puts students[0].get_info
puts student3_short.to_s
puts "Короткий студент валиден? #{student2_short.validate?}"