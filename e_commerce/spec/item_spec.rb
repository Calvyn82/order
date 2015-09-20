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

  it "converts an item to json" do
    expect(@item.to_json).to be_a(String)
  end

  it "builds the item from json" do
    json_string = @item.to_json
    built_item  = Item.from_json(json_string)
    expect(built_item).to be_an_instance_of(Item)
    expect(built_item.price).to be(100.00)
  end
end
