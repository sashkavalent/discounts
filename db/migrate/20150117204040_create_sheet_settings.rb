class CreateSheetSettings < ActiveRecord::Migration
  def change
    create_table :sheet_settings do |t|
      t.string :page_with_link_url
      t.string :download_link_selector
      t.integer :rows_number
      t.integer :columns_number
      t.integer :margin_left
      t.integer :margin_top
      t.integer :margin_right
      t.integer :margin_bottom
      t.string :type
      t.references :chain, index: true

      t.timestamps null: false
    end
  end
end
