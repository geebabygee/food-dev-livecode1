class Router

  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
    @employee = nil
  end

  def run
    @employee = @sessions_controller.sign_in # we catch the employee instance here from the controller sign-in method
    while @running
      if @employee.manager? # we check if he is a manager
        choice = manager_menu
        print `clear`
        action_manager(choice)
      else
        choice = delivery_guy_menu
        print `clear`
        action_delivery_guy(choice)
      end
    end
  end

  def manager_menu
    puts "-" * 20
    puts "-------MENU---------"
    puts "-" * 20
    puts "What would you like to do?"
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. List undelivered orders"
    puts "6. Update a meal"
    puts "7. Delete a meal"
    puts "8. Add new order"
    puts "9.Quit"
    print "> "
    gets.chomp.to_i
  end

  # def manager_menu
  #   puts "-" * 20
  #   puts "-------MENU---------"
  #   puts "-" * 20
  #   puts "What would you like to do?"
  #   puts "1. List meals"
  #   puts "2. Add a meal"
  #   puts "3. List customers"
  #   puts "4. Add a customer"
  #   puts "8. Quit"
  #   print "> "
  #   gets.chomp.to_i
  # end

  def delivery_guy_menu
    puts "-" * 20
    puts "-------MENU---------"
    puts "-" * 20
    puts "What would you like to do?"
    puts "1. List my undelivered orders"
    puts "2. Mark an order as delivered"
    puts "8. Quit"
    print "> "
    gets.chomp.to_i
  end


  def action_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @meals_controller.update
    when 7 then @meals_controller.delete
    when 8 then @orders_controller.add
    when 9
        @running = false
        puts "Goodbye 👋!"
    end
  end

  # def action_manager(choice)
  #   case choice
  #   when 1 then @meals_controller.list
  #   when 2 then @meals_controller.add
  #   when 3 then @customers_controller.list
  #   when 4 then @customers_controller.add
  #   when 8
  #     @running = false
  #     puts "Goodbye 👋!"
  #   end
  # end

  def action_delivery_guy(choice)
    case choice
    when 1 then puts "TODO..."
    when 2 then puts "TODO..."

    when 8
      @running = false
      puts "Goodbye 👋!"
    end
  end

end
