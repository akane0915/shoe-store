require "spec_helper"

describe(Store) do
  it {should have_and_belong_to_many :brands}


    it "returns the store's storename" do
      store = Store.create({storename: "Portland"})
      brand = Brand.create({brandname: "Adidas"})
      store.brands.push(brand)
      expect(store.brands). to eq [brand]
    end


  describe "#storename" do
    it "returns the store's storename" do
      store = Store.create({storename: "Portland"})
      expect(store.storename). to eq "Portland"
    end
  end

  describe "#capitalize_storename" do
    it "converts the storename first letter to a capital letter before saving" do
      store = Store.create({storename: "portland"})
      expect(store.storename). to eq "Portland"
    end
  end
end
