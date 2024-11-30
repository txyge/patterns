require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'

class Student < Base
  attr_accessor :last_name, :first_name, :surname
  def initialize(surname:, last_name:, first_name:, id: nil, phone: nil, mail: nil, git: nil, telegram: nil)
    super(id: id, git: git)
    self.last_name = last_name
    self.first_name = first_name
    self.surname = surname
    set_contact(phone: phone, mail: mail, telegram: telegram)
  end

  def self.from_string(string)
    attr = {}
    begin
      attr[:id], attr[:surname], attr[:first_name], attr[:last_name], attr[:phone], attr[:telegram], attr[:mail], attr[:git] = string.split(", ").map(&:strip)
      new(
        id: attr[:id],
        surname: attr[:surname],
        first_name: attr[:first_name],
        last_name: attr[:last_name],
        phone: attr[:phone],
        mail: attr[:mail],
        git: attr[:git],
        telegram: attr[:telegram]
      )
    rescue ArgumentError => e
      raise ArgumentError, "Ошибка парсинга строки: #{e.message}"
    end
  end

  def get_contact
    if @phone
      "Телефон: #{@phone}"
    elsif @telegram
      "Телеграм: #{@telegram}"
    elsif @mail
      "Почта: #{@mail}"
    else
      ''
    end
  end

  def get_info()
      "#{surname} #{first_name[0]}.#{last_name[0]}| Гит: #{git} | Связь: #{get_contact}"\
  end

  def to_s
    "ID: #{@id}\n" +
    "Фамилия: #{@surname}\n" +
    "Имя: #{@first_name}\n" +
    "Отчество: #{@last_name}\n" +
    (@git ? "Git: #{@git}\n" : "") +
    (@phone ? "Телефон: #{@phone}\n" : "") +
    (@telegram ? "Телеграм: #{@telegram}\n" : "") +
    (@mail ? "Почта: #{@mail}\n" : "")
  end
  
  def has_contacts?()
    if @phone==nil && @telegram==nil && @mail==nil
      false
    else
      true
    end
  end

  def self.valid_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

  def validate_fio(value)
    raise ArgumentError, "Это поле обязательно" if value.nil? || value.strip.empty?
    raise ArgumentError, "Это поле должно содержать только буквы" unless value =~ /^[а-яА-ЯёЁa-zA-Z]+$/
    value
  end

  def valid_telegram(telegram)
    if telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
      @telegram = telegram
    else
      raise ArgumentError, "Неправильно введен телеграм"
    end
  end

  def valid_mail(mail)
    if mail.match?(/\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/)
      @mail = mail
    else
      raise ArgumentError, "Неправильно введена почта"
    end
  end

  private

  def set_contact(phone: nil, mail: nil, telegram: nil)
    if !phone.nil?
      @phone = phone
    end
    if !telegram.nil?
      @telegram = telegram
    end
    if !mail.nil?
      @mail = mail
    end
  end
end
