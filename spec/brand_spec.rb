require "spec_helper"

describe(Brand) do
  it {should have_and_belong_to_many :stores}

  describe "#capitalize_brandname" do
    it "converts the brandname first letter to a capital letter before saving" do
      brand = Brand.create({brandname: "adidas"})
      expect(brand.brandname). to eq "Adidas"
    end
  end
end
