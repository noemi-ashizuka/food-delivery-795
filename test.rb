require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'

# pizza = Meal.new(name: "Pizza", price: 20)

# p pizza.name

meals_csv = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meals_csv)

p meal_repo
