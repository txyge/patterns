require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'
require 'date'

class UpdateStudent < Base
  include Comparable
  attr_reader :brithdate
  attr_accessor :last_name, :first_name, :surname
  def initialize(surname:, last_name:, first_name:, brithdate:, id: nil, phone: nil, mail: nil, git: nil, telegram: nil)
    super(id: id, git: git)
    self.last_name = last_name
    self.first_name = first_name
    self.surname = surname
    self.brithdate = brithdate
    set_contact(phone: phone, mail: mail, telegram: telegram)
  end

  def brithdate=(brithdate)
    @brithdate = Date.parse(brithdate) rescue raise(ArgumentError, "Неправильно введена дата рождения")
  end

  def <=>(other)
    brithdate <=> other.brithdate
  end

  def self.from_string(string)
    attr = {}
    begin
      attr[:id], attr[:surname], attr[:first_name], attr[:last_name], attr[:brithdate], attr[:phone], attr[:telegram], attr[:mail], attr[:git] = string.split(", ").map(&:strip)
      new(
        id: attr[:id],
        surname: attr[:surname],
        first_name: attr[:first_name],
        last_name: attr[:last_name],
        brithdate: attr[:brithdate],
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
    "Дата рождения: #{@brithdate}\n" +
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

  def self.validate_fio(name)
    name.match?(/\A[А-ЯЁ][а-яё]+\z/)
  end

  def self.valid_telegram(telegram)
    telegram.match?(/\A@[a-zA-Z0-9_]+\z/)
  end

  def self.valid_mail(mail)
    mail.match?(/\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/)
  end
 
  def first_name=(first_name)
    if self.validate_fio(first_name)
      @first_name = first_name
    else
      raise ArgumentError, "Неправильно введено имя"
    end
  end

  def last_name=(last_name)
    if self.validate_fio(last_name)
      @last_name = last_name
    else
      raise ArgumentError, "Неправильно введена фамилия"
    end
  end

  def surname=(surname)
    if self.validate_fio(surname)
      @surname = surname
    else
      raise ArgumentError, "Неправильно введено отчество"
    end
  end

  private

  def phone=(phone)
    if self.valid_phone(phone)
      @phone = phone
    else
      raise ArgumentError, "Неправильно введен номер телефона"
    end
  end

  def telegram=(telegram)
    if self.valid_telegram(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Неправильно введен телеграм"
    end
  end


  def mail=(mail)
    if self.valid_mail(mail)
      @mail = mail
    else
      raise ArgumentError, "Неправильно введена почта"
    end
  end


  def set_contact(phone: nil, mail: nil, telegram: nil)
    if !phone.nil?
      self.phone = phone
    end
    if !telegram.nil?
      self.telegram = telegram
    end
    if !mail.nil?
      self.mail = mail
    end
  end
end
