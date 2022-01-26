require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def sign_in
    # we need the view to ask for a username and store it
    username = @sessions_view.ask_for('username')
    # we need the view to ask for a password and store it
    password = @sessions_view.ask_for('password')
    # we need to ask the repository for an employee instance with the username
    employee = @employee_repository.find_by_username(username) # instance
    # check if the employee exists and if the password from user input matches the one in the csv
    if employee && employee.password == password
      # if yes, "sign them in" - welcome message
      @sessions_view.welcome(employee) # nil
      # if not, error message
      return employee
    else
      @sessions_view.wrong_credentials
      sign_in
    end
  end
end
