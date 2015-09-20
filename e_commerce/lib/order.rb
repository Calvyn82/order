require "json"

class Order
  def initialize(order_items:, tax_rate:, order_total: nil)
    @order_items = order_items
    @tax_rate    = tax_rate
    @order_total = order_total ? order_total : calculate_total
  end

  attr_reader :order_items, :tax_rate, :order_total

  def to_json
    object_hash = { order_items: order_items, tax_rate: tax_rate, order_total: order_total }
    object_hash.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    self.new(
      order_items: data["order_items"], 
      tax_rate:    data["tax_rate"], 
      order_total: data["order_total"]
    )
  end

  def items_collection
    order_items.map { |item| item.name }
  end

  private

  def calculate_total
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
