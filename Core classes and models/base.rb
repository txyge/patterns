class Base
  attr_reader :id, :git

  def initialize(id:, git: nil)
    self.id = id
    self.git = git if !git.nil?
  end

  protected 

 
  # сеттеры
  def git=(git)
    if git.match?(/\Ahttps:\/\/github\.com\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end


  def id=(id)
    if id.match?(/^\d+$/)
      @id= id
    else
      raise ArgumentError, "Неправильно введен id"
    end
  end
end
  