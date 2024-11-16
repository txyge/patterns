require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'

student1 = Student.new(last_name: "Иванов", first_name: "Иван",surname: "Сергеевич", phone: "+79991234567", telegram: "@ivanov", mail: "ivanov@example.com", git: "https://github.com/ivanov")
student2 = Student.new(id: 2, last_name: "Петров", first_name: "Петр", surname: "Сергеевич", phone: "+71234567890", telegram: "@petrov", mail: "petrov@example.com", git: "https://github.com/petrov")

puts student1.get_contacts
puts student2.to_s
