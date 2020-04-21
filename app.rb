require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"
require_relative "router.rb"

# Testing our controller actions using the router

# Repositories
meal_repo = MealRepository.new("data/meals.csv")
customer_repo = CustomerRepository.new("data/customers.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")

# p employee_repo
# Controllers
meals_controller = MealsController.new(meal_repo)
customers_controller = CustomersController.new(customer_repo)
sessions_controller = SessionsController.new(employee_repo)

# Router
router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
