require_relative "base_view"

class SessionsView < BaseView

  def signed_in_successfully
    puts "Welcome, come on in, signed in successfully!!"
  end

  def wrong_credentials
    puts "Nopppppppppppe, try again"
  end


end
