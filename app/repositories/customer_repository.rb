require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository

 private

 def load_csv # From CSV strings ---> Ruby instances of element
  csv_options = {headers: :first_row, header_converters: :symbol}
  CSV.foreach(@csv_file, csv_options) do |row|
    #row is now a hash --> {id: "1", name: "Iri", address: "Lisbon"}
    row[:id] = row[:id].to_i
    row[:address] = row[:address]
    @elements << Customer.new(row) # @elements because this is now found in the Base Repository
  end
  @next_id = @elements.last.id + 1 unless @elements.empty?
 end

 def save_to_csv # From ruby instances ---> csv strings
  CSV.open(@csv_file, 'wb') do |row|
    row << ["id", "name", "address"]
    @elements.each do |customer| # @elements because this is now found in the Base Repository
      row << [customer.id, customer.name, customer.address]
    end
   end
 end

end
