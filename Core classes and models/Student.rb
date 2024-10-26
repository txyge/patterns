class Student
  attr_accessor :id, :surname, :first_name, :last_name, :phone, :telegram, :email, :git

  def initialize(surname, first_name, last_name = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = generate_id
    self.surname = surname
    self.first_name = first_name
    self.last_name = last_name
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end
  def generate_id
    Random.rand(0..100)
  end

    def phone=(phone)
    if phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
      @phone = phone
    else
      raise ArgumentError, "Некорректный номер телефона"
    end
  end
  
  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@first_name}, Отчество: #{@last_name}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
