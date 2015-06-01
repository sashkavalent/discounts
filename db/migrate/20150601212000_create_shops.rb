class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :address
      t.time :opening_at
      t.time :closing_at
      t.references :chain, index: true
      t.timestamps null: false
    end
  end
end
