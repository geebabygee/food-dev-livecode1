class BaseView

  def display(elements) # array of meal instances
    elements.each do |element|
      puts element.display_in_list
      # element is an instance (meal or customer instance) --> call an instance method on it called display_in_list --> respective model and calls that method
    end
  end

  def ask_for(something)
    puts "What's the #{something} please?"
    gets.chomp
  end

end
