class Router
  def initialize(meals_controller,customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    employee = @sessions_controller.sign_in
    while @running
      if employee.manager?
        choice = manager_menu
        print `clear`
        manager_action(choice)
      else
        choice = delivery_guy_menu
        print `clear`
        delivery_guy_action(choice)
      end
    end
  end

  private


  def manager_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List customers"
    puts "4 - Add a customer"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def delivery_guy_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List my orders"
    puts "2 - Mark an order as delivered"
    puts "9 - Quit"
    print "> "
    gets.chomp.to_i
  end


  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 9 then @running = false
    else
      puts "Try again..."
    end
  end

  def delivery_guy_action(choice)
    case choice
    when 1 then puts "TODO: to list delivery guy orders"
    when 2 then puts "TODO: to mark an order as delivered"
    when 9 then @running = false
    else
      puts "Try again..."
    end
  end
end
