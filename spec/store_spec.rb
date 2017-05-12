require "spec_helper"

describe(Store) do
  it {should have_and_belong_to_many :brands}

  describe "#capitalize_storename" do
    it "converts the storename first letter to a capital letter before saving" do
      store = Store.create({storename: "portland"})
      expect(store.storename). to eq "Portland"
    end
  end
end
