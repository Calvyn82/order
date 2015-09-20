require "json"

class Item
  def initialize(key:, name:, price:)
    @key    = key
    @name   = name
    @price  = price.round(2)
  end

  attr_reader :key, :name, :price

  def to_json
    object_hash = { key: key, name: name, price: price }
    object_hash.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    self.new(
      key: data["key"],
      name: data["name"],
      price: data["price"]
    )
  end
end
