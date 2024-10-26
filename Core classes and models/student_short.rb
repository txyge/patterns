require_relative 'C:\Users\slast\OneDrive\Рабочий стол\Ruby\Core classes and models\base.rb'
class Student_short < Base
  def initialize(student, contact: nil)
    super(id: student.id, git: student.git)
    @surname_initials = "#{student.surname} #{student.first_name[0]}.#{student.last_name ? " #{student.last_name[0]}." : ''}"
    @contact = student.get_contacts || contact
  end

  def to_s
    "ID: #{@id}, ФИО: #{@surname_initials} Git: #{@git ? @git : 'нет'} Контакт: #{@contact ? @contact : 'нет'} "
  end

end
