class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. Meal: #{order.meal.name} - Customer: #{order.customer.name} - Address: #{order.customer.address} - Rider: #{order.employee.username}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end
end
