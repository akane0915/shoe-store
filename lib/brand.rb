class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_brandname

  def currency_format
    currency_price = price.to_s
    "$#{currency_price}0"
  end

  private
    def capitalize_brandname
      brandname.capitalize!
    end


end
