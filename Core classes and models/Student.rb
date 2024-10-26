class Student
  attr_accessor :id, :surname, :first_name, :last_name, :phone, :telegram, :email, :git

  def initialize(surname, first_name, last_name = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = generate_id
    @surname = surname
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end
  def generate_id
    Random.rand(0..100)
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@first_name}, Отчество: #{@last_name}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
