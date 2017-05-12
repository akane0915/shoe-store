class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :brands, :stores do |t|
      t.index [:brand_id, :store_id]
    end
  end
end
