require "spec_helper"

describe(Store) do
  it {should have_and_belong_to_many :brands}

  describe "#brands" do
    it "returns the store's storename" do
      store = Store.create({storename: "Portland"})
      brand = Brand.create({brandname: "Adidas"})
      store.brands.push(brand)
      expect(store.brands).to eq [brand]
    end
  end

  describe "#storename" do
    it "returns the store's storename" do
      store = Store.create({storename: "Portland"})
      expect(store.storename).to eq "Portland"
    end
  end

  describe "#capitalize_storename" do
    it "converts the storename first letter to a capital letter before saving" do
      store = Store.create({storename: "portland"})
      expect(store.storename).to eq "Portland"
    end
  end

  it "validates the storename is unique before saving" do
    store1 = Store.create({storename: "portland"})
    store2 = Store.create({storename: "Portland"})
    expect(store2.save).to eq false
  end

  it "validates the length of the storename is 100 characters or less" do
    store = Store.new({storename: "a" * 101})
    expect(store.save).to eq false
  end
end
