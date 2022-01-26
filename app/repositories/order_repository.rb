require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    @orders = []
    load_csv if File.exist?(@csv_file_path)
  end

  # def all
  #   @orders
  # end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def my_undelivered_orders(employee)
    undelivered_orders.select { |order| order.employee == employee }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i

      meal_id = attributes[:meal_id].to_i
      attributes[:meal] = @meal_repository.find(meal_id)

      customer_id = attributes[:customer_id].to_i
      attributes[:customer] = @customer_repository.find(customer_id)

      employee_id = attributes[:employee_id].to_i
      attributes[:employee] = @employee_repository.find(employee_id)

      attributes[:delivered] = attributes[:delivered] == 'true'

      @orders << Order.new(attributes)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
