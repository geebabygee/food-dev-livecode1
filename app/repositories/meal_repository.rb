require_relative "../models/meal"
require_relative "../repositories/base_repository"

class MealRepository < BaseRepository

  # Inherit the initializer with all instance variables
  # Inherit all methods

 def destroy(id)
   meal = find(id)
   @elements.delete(meal)
   save_to_csv
 end

 def update(id, new_name, new_price)
  meal = find(id)
  meal.name = new_name
  meal.price = new_price
  # add(meal)
  save_to_csv
 end

 private

 def load_csv # From CSV strings ---> Ruby instances of meal
  csv_options = {headers: :first_row, header_converters: :symbol}
  CSV.foreach(@csv_file, csv_options) do |row|
    # row = {#<CSV::Row id:"1" name:"Pide" price:"15">}
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    @elements << Meal.new(row)
  end
  @next_id = @elements.last.id + 1 unless @elements.empty?
 end

 def save_to_csv # From ruby instances ---> csv strings
  CSV.open(@csv_file, 'w') do |row|
    row << ["id", "name", "price"]
    @elements.each do |meal|
      row << [meal.id, meal.name, meal.price]
    end
  end
 end





























end



