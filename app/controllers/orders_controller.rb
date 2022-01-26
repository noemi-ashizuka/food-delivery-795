require_relative '../views/orders_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    # ask the repository for undelivered orders
    orders = @order_repository.undelivered_orders
    # give the orders to the view to display them
    @orders_view.display(orders)
  end

  def add
    # get all the meals from the meal repo
    meals = @meal_repository.all
    # display the meals to the manager
    @meals_view.display(meals)
    # have the view ask for the index of the meal to add to the order
    meal_index = @meals_view.ask_for('number').to_i - 1
    # get the instance from the meals array using that index
    meal = meals[meal_index]
    # get all the customers from the customer repo
    customers = @customer_repository.all
    # display the customers to the manager
    @customers_view.display(customers)
    # have the view ask for the index of the customer to add to the order
    customer_index = @customers_view.ask_for('number').to_i - 1
    # get the instance from the customers array using that index
    customer = customers[customer_index]

    # get all the customers from the customer repo
    employees = @employee_repository.all_riders
    # display the employees to the manager
    @employees_view.display(employees)
    # have the view ask for the index of the employee to add to the order
    employee_index = @employees_view.ask_for('number').to_i - 1
    # get the instance from the employees array using that index
    employee = employees[employee_index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_my_orders(employee)
    # ask the order repo for MY orders
    orders = @order_repository.my_undelivered_orders(employee)
    # ask the view to display the orders
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    # ask the repo for all my undelivered orders
    orders = @order_repository.my_undelivered_orders(employee)
    # ask the view to display the orders
    @orders_view.display(orders)
    # tell the view to ask for an index for the order to mark
    index = @orders_view.ask_for('number of the order to mark').to_i - 1
    # get the order instance to mark
    order = orders[index]
    # tell the repo to mark it, and save it
    @order_repository.mark_as_delivered(order)
  end
end
