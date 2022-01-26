class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @username = attributes[:username] # strings
    @password = attributes[:password] # strings
    @role = attributes[:role] # strings
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
