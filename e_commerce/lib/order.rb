require "json"

class Order
  def initialize(order_items:)
    @order_items = order_items.sort_by { |item| item.name }
  end

  attr_reader :order_items

  def order_total(tax_rate)
    calculate_total(tax_rate)
  end

  def to_json
    object_hash = { 
      order_items:
      order_items.map do |item| 
        item.to_json 
      end
    }
    object_hash.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    self.new(
      order_items: data["order_items"].map { |item| Item.from_json(item) }
    )
  end

  def items_collection
    order_items.map { |item| item.name }
  end

  private

  def calculate_total(tax_rate)
    taxable_price = 0.00
    untaxed_price = 0.00
    order_items.each do |item|
      if item.key == :material
        taxable_price = (taxable_price + item.price).round(2)
      else
        untaxed_prace = (untaxed_price + item.price).round(2)
      end
    end
    taxable_total = (taxable_price + (taxable_price * (tax_rate.to_f / 100))).round(2)
    (untaxed_price + taxable_total).round(2)
  end
end
