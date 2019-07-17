require_relative "../../app/views/meals_view"
require_relative "../../app/models/meal"

class MealsController
  def initialize(meal_repo)
    @meals_repo = meal_repo
    @view = MealsView.new
  end

  def list
    meals = @meals_repo.all
    @view.display(meals)
  end

  def create
    name = @view.ask_user_for("name")
    price = @view.ask_user_for("price")
    meal = Meal.new(name: name, price: price)
    @meals_repo.add(meal)
  end
end
