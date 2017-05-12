class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_brandname

  private
    def capitalize_brandname
      brandname.capitalize!
    end
end
