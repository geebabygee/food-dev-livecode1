require_relative "../../app/views/meals_view"
require_relative "../../app/models/meal"

class MealsController
 def initialize(meal_repo)
  @meal_repo = meal_repo
  @view = MealsView.new
 end

 def list
  #1. Get meals from meal repo (R)
  meals = @meal_repo.all
  #2. Send to view to display (V)
  @view.display(meals)
 end


 def add
  #1. Ask user for name and price (V)
  name = @view.ask_for("name")
  price = @view.ask_for("price").to_i
  #2. Create a meal instance with info from user (M)
  meal = Meal.new(name: name, price: price)
  #3. Send meal instance to repo to store (R)
  @meal_repo.add(meal)
 end

 def update
   list
   id = @view.ask_for("which meal to update?").to_i
   # meal = @meal_repo.find(id)
   new_name = @view.ask_for("new name")
   new_price = @view.ask_for("new price").to_i
   @meal_repo.update(id, new_name, new_price)
 end

 def delete
   list
   meal = @view.ask_for("which meal to delete?").to_i
   @meal_repo.destroy(meal)
 end



end

