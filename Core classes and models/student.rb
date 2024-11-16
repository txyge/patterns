require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'

class Student
  attr_accessor :id, :last_name, :first_name, :surname, :git
  def initialize(surname:, last_name:, first_name:, id: nil, phone: nil, mail: nil, git: nil, telegram: nil)
    @last_name = last_name
    @first_name = first_name
    @surname = surname
    @id = id
    @git = git
    set_contact(phone: phone, mail: mail, telegram: telegram)
  end


  def self.create_student(string)
    attr={}
    new(
      id: attrs[:id],
      surname: attrs[:surname],
      first_name: attrs[:first_name],
      last_name: attrs[:last_name],
      phone: attrs[:phone],
      mail: attrs[:mail],
      git: attrs[:git],
      telegram: attrs[:telegram]
    )
  end
  def get_contacts()
    contact_info = []
    contact_info << "Телефон: #{@phone}" if !@phone.nil?
    contact_info << "Телеграм: #{@telegram}" if !@telegram.nil?
    contact_info << "Почта: #{@mail}" if !@mail.nil?
    contact_info.join(", ")
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
  def has_contacts?()
    if @phone==nil && @telegram==nil && @mail==nil
      false
    else
      true
    end
  end
  
  def has_git?()
    if @git==nil
      false
    else
      true
    end
  end

  def valid?()
    if has_contacts?() && has_git?()
      true
    else
      false
    end
  end

  def self.valid_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

 
  def phone=(phone)
    if self.class.valid_phone(phone)
      @phone = phone
    else
      raise ArgumentError, "Недопустимый номер телефона"
    end
  end

  def validate_last_name(name)
    raise ArgumentError, "Фамилия обязательна" if name.nil? || name.strip.empty?
    raise ArgumentError, "Фамилия должна содержать только буквы" unless name =~ /^[а-яА-ЯёЁa-zA-Z]+$/
    name
  end

  def validate_first_name(name)
    raise ArgumentError, "Имя обязательно" if name.nil? || name.strip.empty?
    raise ArgumentError, "Имя должно содержать только буквы" unless name =~ /^[а-яА-ЯёЁa-zA-Z]+$/
    name
  end
  
  def validate_surname(name)
    raise ArgumentError, "Отчество обязательно" if name.nil? || name.strip.empty?
    raise ArgumentError, "Отчество должно содержать только буквы" unless name =~ /^[а-яА-ЯёЁa-zA-Z]+$/
    name
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

  def valid_git(git)
    if git.match?(/\Ahttps:\/\/github\.com\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end

end