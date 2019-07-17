class SesssionsView

  def ask_for(stuff)
    puts "What's the #{stuff}?"
    gets.chomp
  end

  def wrong_credentials
    puts "Nopppppe, try again!"
  end

  def signed_in_succesfully(employee)
    if employee.manager?
      puts "Yes Boss! You look dope today #{employee.username}, did you lose any weight?"
    else
      puts "Sup'#{employee.username}! You're late! Get to work!"
    end
  end
end
