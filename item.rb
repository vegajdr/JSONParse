class Item

  attr_reader :id, :name, :category, :price

  def initialize id, name, price, category = nil
    @id = id
    @name = name
    @price = price
    @category = category
  end
end
