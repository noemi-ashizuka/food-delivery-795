class EmployeesView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} - Role: #{employee.role}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end
end
