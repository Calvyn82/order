require_relative "../lib/order"

describe "Order" do
  before(:each) do
    item1 = Item.new(key: :material, name: "car", price: 1000.00)
    item2 = Item.new(key: :service, name: "tune-up", price: 50.00)
    item3 = Item.new(key: :material, name: "bike", price: 33.95)
    @items_array = [item1, item2, item3]
    @order = Order.new(order_items: @items_array, tax_rate: 8)
  end

  it "has an array of order items" do
    expect(@order.order_items).to be_an(Array)
    expect(@order.order_items).to eq(@items_array)
  end

  it "has a tax rate" do
    expect(@order.tax_rate).to be_a(Numeric)
  end

  it "normalizes the tax rate" do
    expect(@order.tax_rate).to be_a(Float)
    expect(@order.tax_rate).to eq(0.08)
  end

  it "has an order total" do
    expect(@order.order_total).to be_a(Float)
  end

  it "accounts for taxable and untaxable rates for the order total" do
    expect(@order.order_total).to eq(1116.67)
  end

  it "converts the object to json" do
    expect(@order.to_json).to be_a(String)
  end

  it "builds the object from json" do
    json_string = @order.to_json
    expect(Order.from_json(json_string)).to be_an_instance_of(Order)
  end

  it "returns an array of the item names" do
    expect(@order.items_collection).to eq(["car", "tune-up", "bike"])
  end
end
