class Student
  attr_accessor :id, :surname, :first_name, :last_name, :phone, :telegram, :email, :git

  def initialize(surname:, first_name:, last_name:, id: nil, phone: nil, email: nil, git: nil, telegram: nil)
    super(id: id, git: git)
    set_contacts(phone: phone, telegram: telegram, email: email)
    self.surname = surname
    self.first_name = first_name
    self.last_name = last_name
  end
  
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if !phone.nil?
      self.phone = phone
    end
    if !telegram.nil?
      self.telegram = telegram
    end
    if !email.nil?
      self.email = email
    end
  end
   def self.parse(string)
    attributes = {}

    string.split(', ').each do |pair|
      key, value = pair.split(': ')
      attributes[key] = value
    end

    new(
      id: attributes['ID'],
      surname: attributes['Фамилия'],
      first_name: attributes['Имя'],
      last_name: attributes['Отчество'],
      phone: attributes['Телефон'],
      telegram: attributes['Телеграм'],
      email: attributes['Почта'],
      git: attributes['Гит']
    )
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

    def getinfo
    "ID: #{@id}, ФИО: #{@surname} #{@first_name[0]} #{@last_name[0]} Git: #{@git ? @git : 'нет'} #{get_contacts}"
  end

  protected
  
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
