require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"
require_relative "router.rb"

meal_repo = MealRepository.new("data/meals.csv")
customer_repo = CustomerRepository.new("data/customers.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")
meal_controller = MealsController.new(meal_repo)
customer_controller = CustomersController.new(customer_repo)
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(meal_controller, customer_controller, sessions_controller)

router.run
