class Meal

  # attr_reader :name, :price
  attr_accessor :id, :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def display_in_list # Used for BaseView strategy in order to customise each model attributes
    "#{@id}. ~ #{@name} - $#{@price}"
  end
end
