# require_relative 'app/models/meal'
# require_relative 'app/repositories/meal_repository'

# # pizza = Meal.new(name: "Pizza", price: 20)

# # p pizza.name

# meals_csv = File.join(__dir__, 'data/meals.csv')
# meal_repo = MealRepository.new(meals_csv)

# p meal_repo

require_relative 'app/repositories/employee_repository'

csv_file = 'data/employees.csv'

employee_repository = EmployeeRepository.new(csv_file)

p employee_repository
