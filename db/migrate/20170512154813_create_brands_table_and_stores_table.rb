class CreateBrandsTableAndStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string 'brandname'
      t.decimal 'price', precision: 10, scale: 2
      t.timestamps
    end

    create_table :stores do |t|
      t.string 'storename'
      t.timestamps
    end

  end
end
