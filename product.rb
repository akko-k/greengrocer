class Product
  attr_reader :id, :name, :price, :count
  @@count = 30

  def initialize(name:, price:)
    @id = @@count += 1
    @name = name
    @price = price
  end
end
