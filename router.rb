class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    puts "Welcome to our Restaurant!"
    puts "=========================="

    while @running
      @employee = @sessions_controller.sign_in

      while @employee
        # a condition to check if employee is manager or rider
        if @employee.manager?
          display_manager_menu
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_rider_menu
          action = gets.chomp.to_i
          print `clear`
          route_rider_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then sign_out
    when 0 then stop
    else
      puts "Please press 1, 2 or 3."
    end
  end

  def route_rider_action(action)
    case action
    when 1 then puts "TODO"
    when 2 then puts "TODO"
    # when 3 then @customers_controller.list
    # when 4 then @customers_controller.add
    when 9 then sign_out
    when 0 then stop
    else
      puts "Please press 1, 2 or 3."
    end
  end

  def stop
    @running = false
    sign_out
  end

  def sign_out
    @employee = nil
  end

  def display_manager_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all Meals"
    puts "2 - Add new Meal"
    puts "3 - List customers"
    puts "4 - Add new customer"
    puts "9 - Sign out"
    puts "0 - Stop and exit the program"
  end

  def display_rider_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all my orders"
    puts "2 - Mark an order as delivered"
    # puts "3 - List customers"
    # puts "4 - Add new customer"
    puts "9 - Sign out"
    puts "0 - Stop and exit the program"
  end
end
