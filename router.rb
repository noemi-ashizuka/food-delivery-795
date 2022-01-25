class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to our Restaurant!"
    puts "=========================="

    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6 or 7."
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all Meals"
    puts "2 - Add new Meal"
    puts "3 - Edit a Meal"
    puts "4 - Delete a Meal"
    puts "5 - List customers"
    puts "6 - Add new customer"
    puts "7 - Stop and exit the program"
  end
end
