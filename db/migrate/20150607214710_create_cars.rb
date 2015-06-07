class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :registration_number
      t.references :car_owner

      t.timestamps null: false
    end
  end
end
