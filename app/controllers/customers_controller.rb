require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    display_customers
  end

  def add
    # ask the view to get the name of the customer from the user & store it
    name = @customers_view.ask_for('name')
    # ask the view to get the price of the customer from the user & store it
    address = @customers_view.ask_for('address')
    # create a new customer instance with the info from the view
    customer = Customer.new(name: name, address: address)
    # store this customer in the repository
    @customer_repository.add(customer)
    display_customers
  end

  private

  def display_customers
    # get all customers from customer_repository
    customers = @customer_repository.all
    # ask the view to display them
    @customers_view.display(customers)
  end
end
