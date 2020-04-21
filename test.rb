require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"


# Testing our Models and our Repositories (before Controller actions)

# Model instances
pide = Meal.new(name: "Pide", price: 15)

# Repository instances
meal_repo = MealRepository.new("data/meals.csv")
p meal_repo




















