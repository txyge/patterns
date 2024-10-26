require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'
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

# Создаем несколько студентов
students = [
  Student.parsing('ID: 1, Фамилия: Иванов, Имя: Иван, Отчество: Иванович, Телефон: +79162345678, Телеграм: @ivanov, Почта: ivanov@gmail.com, Гит: https://github.com/ivanov/repo.git'),
  Student.parsing('ID: 2, Фамилия: ivanov, Имя: ivan, Отчество: ivаnovich, Телефон: +98765432101, Телеграм: @ivanovik, Почта: neivanov@gmail.com, Гит: https://github.com/neivanov/repo.git'),
  Student.parsing('ID: 3, Фамилия: сидоров, Имя: сидро, Отчество: sidoroвич, Телефон: +98234568795, Телеграм: @sdrochuk, Почта: sadro@gmail.com, Гит: https://github.com/sidro/repo.git'),
]

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
