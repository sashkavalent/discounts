class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
