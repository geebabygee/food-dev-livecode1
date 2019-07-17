require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/employee_repository"

pad_thai = Meal.new(name: "Pad Thai", price: 10)
meal_repo = MealRepository.new("data/meals.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")
p employee_repo
# p pad_thai
