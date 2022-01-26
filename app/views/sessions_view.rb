class SessionsView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username}"
  end

  def wrong_credentials
    puts "Sorry wrong username or password."
  end
end
