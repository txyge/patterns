require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'
class Student_short < Base

  def self.create_from_students(student)
    surname_initials = "#{student.last_name} #{student.first_name[0]}."
    surname_initials += " #{student.surname[0]}." if student.surname

    new(
      id: student.id,
      git: student.git,
      surname_initials: surname_initials,
      contact: student.get_contact
    )
  end

  def self.create_from_string(string)
    attributes = string.split(', ').each_with_object({}) do |pair, hash|
      key, value = pair.split(': ')
      hash[key] = value
    end

    new(
      id: attributes['ID'],
      git: attributes['Git'],
      surname_initials: attributes['ФИО'],
      contact: [attributes['Тел'], attributes['Телеграм'], attributes['Почта']].compact.first
    )
  end

  def surname_initials=(surname_initials)
    @surname_initials = surname_initials
  end

  def contact=(contact)
    @contact = contact
  end

  def has_contact?()
    if self.contact == nil
      false
    else
      true  
    end
  end

  def to_s
    id = @id || 'нет'
    git = @git || 'нет'
    contact = @contact || 'нет'
    "ID: #{id}, ФИО: #{@surname_initials}, Git: #{git}, Контакт: #{contact}"
  end

  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    self.surname_initials = surname_initials
    @contact = contact
  end
end
