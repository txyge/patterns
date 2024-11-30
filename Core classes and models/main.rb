require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'

student1 = Student.new(last_name: "Иванов", first_name: "Иван",surname: "Сергеевич", phone: "+79991234567", telegram: "@ivanov", mail: "ivanov@example.com")
student2 = Student.new(id: "2", last_name: "Петров", first_name: "Петр", surname: "Сергеевич", phone: "+71234567890", telegram: "@petrov", mail: "petrov@example.com", git: "https://github.com/Bagdad1/repo.git")

# Вывод информации о студентах
puts student1.get_info
puts "\n"
puts student2.get_info
puts "\n"


puts "Студент 1 валиден? #{student1.validate?}"
puts "\n"
puts "Студент 2 валиден? #{student2.validate?}"
puts "\n"

students = [
  Student.from_string("3, Иванов, Иван, Иванович, +7 (999) 123-45-67, @ivanov, ivanov@example.com,  https://github.com/Bagdad1/repo.git")
]

student1_short = Student_short.from_student(students[0])

puts student1_short.to_s

student3_short = Student_short.from_string(students[0].get_info)

puts students[0].get_info
puts student3_short.to_s
puts "Короткий студент валиден? #{student3_short.valid?}"
