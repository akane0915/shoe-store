class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  before_save :capitalize_storename
  validates :storename, uniqueness: true

  private
    def capitalize_storename
      storename.capitalize!
    end
end
