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
end
