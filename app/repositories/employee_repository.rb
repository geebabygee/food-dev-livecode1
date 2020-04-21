require_relative "../repositories/base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository


  # Inherit the initializer with all instance variables
  # Inherit all methods

 def find_by_username(username)
  @elements.find { |employee| employee.username == username }
 end

 private

 def load_csv # From CSV strings ---> Ruby instances of meal
  csv_options = {headers: :first_row, header_converters: :symbol}
  CSV.foreach(@csv_file, csv_options) do |row|
    # row = {#<CSV::Row id:"1" username:"Ulas" password:"pide", role:"delivery_guy">}
    row[:id] = row[:id].to_i
    @elements << Employee.new(row)
  end
  @next_id = @elements.last.id + 1 unless @elements.empty?
 end

end
