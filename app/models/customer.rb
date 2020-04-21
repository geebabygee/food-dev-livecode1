class Customer

  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def display_in_list
    "#{@id}. #{@name} ~ #{@address}"
  end
end
