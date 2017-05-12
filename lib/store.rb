class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  before_save :capitalize_storename
  validates :storename, presence: true, uniqueness: true, length: { maximum: 100 }

  private
    def capitalize_storename
      storename.capitalize!
    end
end
