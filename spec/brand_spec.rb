require "spec_helper"

describe(Brand) do
  it {should have_and_belong_to_many :stores}

  describe "#brandname" do
    it "returns the brand's brandname" do
      brand = Brand.create({brandname: "Adidas"})
      expect(brand.brandname).to eq "Adidas"
    end
  end

  describe "#price" do
    it "returns the brand's price" do
      brand = Brand.create({brandname: "Adidas", price: 20})
      expect(brand.price).to eq 20.0
    end
  end

  describe "#capitalize_brandname" do
    it "converts the brandname first letter to a capital letter before saving" do
      brand = Brand.create({brandname: "adidas"})
      expect(brand.brandname).to eq "Adidas"
    end
  end

  describe "#currency_format" do
    it "is called on the brand instance and returns the price of the brand in currency format with 2 characters after the decimal point" do
      brand = Brand.create({brandname: "adidas", price: 20})
      expect(brand.currency_format).to eq "$20.00"
    end
  end

  it "validates the brandname is not blank before saving" do
    brand1 = Brand.new({brandname: ""})
    expect(brand1.save).to eq false
  end

  it "validates the brandname is unique before saving" do
    brand1 = Brand.create({brandname: "adidas"})
    brand2 = Brand.new({brandname: "adidas"})
    expect(brand2.save).to eq false
  end

  it "validates the length of the brandname is 100 characters or less" do
    brand = Brand.new({brandname: "a" * 101})
    expect(brand.save).to eq false
  end

end
