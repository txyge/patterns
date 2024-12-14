class Base
  attr_reader :id, :git

  def initialize(id: nil, git: nil)
    self.id = id if !id.nil?
    self.git = git if !git.nil?
  end

  def id=(id)
    if id.match?(/^\d+$/)
      @id= id
    else
      raise ArgumentError, "Неправильно введен id"
    end
  end

  def valid?()
    if has_contact?() && has_git?()
      true
    else
      false
    end
  end

  def has_contacts?()
    raise NotImplementedError, "Метод has_contacts? должен быть переопределен в дочернем классе"
  end

  def has_git?()
    if @git==nil
      false
    else
      true
    end
  end

  private 

  # сеттеры
  def git=(git)
    if git.match?(/\Ahttps:\/\/github\.com\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end
end
  
