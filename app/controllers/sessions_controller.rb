require_relative "../../app/views/sessions_view"

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = SessionsView.new
  end

  def sign_in
    #1. Ask for username and password (V)
    username = @view.ask_for("username")
    password = @view.ask_for("password")
    #2. Find employee with username in db (R)
    employee = @employee_repo.find_by_username(username)
    #3. Check that password is the same as in db (R)
    if employee && employee.password == password
      @view.signed_in_successfully
      employee
    else
      @view.wrong_credentials
      sign_in # Recursive call - calls itself again
    end
    #4. Sign in
  end
end
