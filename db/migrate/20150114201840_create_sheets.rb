class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.references :chain, index: true

      t.timestamps null: false
    end
  end
end
