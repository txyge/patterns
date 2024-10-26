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

    def hasgit?()
    if self.git == nil
      false
    else
      true
    end
  end
  def hascontact?()
    if @phone == nil && @telegram == nil && @email==nil
      false
    else  
      true
    end
  end
  def validate?
    hasgit?() && hascontact?()
  end
  
    def phone=(phone)
    if phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
      @phone = phone
    else
      raise ArgumentError, "Некорректный номер телефона"
    end
  end
  
   def email=(email)
    if email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      @email = email
    else
      raise ArgumentError, "Некорректно введен email"
    end
  end

    def telegram=(telegram)
    if telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
      @telegram = telegram
    else
      raise ArgumentError, "Некорректно введен телеграм"
    end
  end

    def first_name=(first_name)
    if first_name.match?(/^[a-zA-Zа-яА-Я\s]+$/)
      @first_name = first_name
    else
      raise ArgumentError, "Некорректно введено имя"
    end
  end

    def surname=(surname) 
    if surname.match?(/^[a-zA-Zа-яА-Я\s]+$/)
      @surname = surname
    else
      raise ArgumentError, "Некорректно введена фамилия"
    end
  end

  def last_name=(last_name)
    if last_name.match?(/^[a-zA-Zа-яА-Я\s]+$/)
      @last_name = last_name
    else
      raise ArgumentError, "Некорректно введено отчество"
    end
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@first_name}, Отчество: #{@last_name}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
