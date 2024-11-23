require_relative 'C:\Users\Extrafly\Desktop\kostia\student.rb'

student1 = Student.new(last_name: "Иванов", first_name: "Иван",surname: "Сергеевич", phone: "+79991234567", telegram: "@ivanov", mail: "ivanov@example.com")
student2 = Student.new(id: "2", last_name: "Петров", first_name: "Петр", surname: "Сергеевич", phone: "+71234567890", telegram: "@petrov", mail: "petrov@example.com", git: "https://github.com/Bagdad1/repo.git")
student3 = Student.from_string("3, Иванов, Иван, Иванович, +7 (999) 123-45-67, @ivanov, ivanov@example.com,  https://github.com/Bagdad1/repo.git")
puts student1.get_info
puts student2.to_s
puts student3
