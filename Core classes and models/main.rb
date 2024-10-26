require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\student.rb'
begin
  student1 = Student.new("Иванов", "Иван", "Иванович", "1234567890", "@kkkk", "ikkk@pika.com", "github.com/ivan")
  puts student1
  student2 = Student.new("петр", "петров")
  puts student2
  student3 = Student.new("зубенко", "михаил", "петрович", "24626345634", )
  puts student3
rescue ArgumentError => e
    puts e.message
end
begin
    student1 = Student.parsing("Иванов, Иван, Иванович, +1 234-567-8901, @ivan, ivanov@example.com, https://github.com/ivan/repo.git")
    puts student1
  
    student2 = Student.parsing("Петров, Петр")  # Это вызовет ошибку при валидации
    puts student2
  rescue ArgumentError => e
    puts e.message
  end
  
  begin
    student3 = Student.parsing("зубенко, михаил, петрович, 24626345634")
    puts student3
    # Это вызовет ошибку, так как отсутствует Git URL
  rescue ArgumentError => e
    puts e.message
  end
  
