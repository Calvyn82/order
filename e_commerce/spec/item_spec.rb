require_relative "../lib/item"

describe "Item" do
  before(:each) do
    @item = Item.new(key: :material, name: "car", price: 100.00001)
  end

  it "has a key" do
    expect(@item.key).to be(:material)
  end

  it "has a name" do
    expect(@item.name).to eq("car")
  end

  it "has a price" do
    expect(@item.price).to be_a(Float)
  end

  it "rounds the price to the penny" do
    expect(@item.price).to be(100.00)
  end
end
