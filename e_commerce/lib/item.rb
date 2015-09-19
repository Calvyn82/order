class Item
  def initialize(key:, name:, price:)
    @key    = key
    @name   = name
    @price  = price.round(2)
  end

  attr_reader :key, :name, :price
end
