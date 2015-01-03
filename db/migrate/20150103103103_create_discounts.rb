class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :product_name
      t.integer :price
      t.float :economy
      t.references :chain, index: true

      t.timestamps null: false
    end
    add_foreign_key :discounts, :chains
  end
end
