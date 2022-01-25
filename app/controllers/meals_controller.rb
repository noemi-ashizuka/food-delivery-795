require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    display_meals
  end

  def add
    # ask the view to get the name of the meal from the user & store it
    name = @meals_view.ask_for('name')
    # ask the view to get the price of the meal from the user & store it
    price = @meals_view.ask_for('price').to_i
    # create a new Meal instance with the info from the view
    meal = Meal.new(name: name, price: price)
    # store this meal in the repository
    @meal_repository.add(meal)
    display_meals
  end

  def edit
    display_meals
    index = @meals_view.ask_for('number').to_i - 1
    meal = @meal_repository.all[index]
    meal.name = @meals_view.ask_for('new name')
    meal.price = @meals_view.ask_for('new price').to_i
    @meal_repository.update
  end

  def destroy
    display_meals
    index = @meals_view.ask_for('number').to_i - 1
    @meal_repository.destroy(index)
  end

  private

  def display_meals
    # get all meals from meal_repository
    meals = @meal_repository.all
    # ask the view to display them
    @meals_view.display(meals)
  end
end
