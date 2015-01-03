class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_attachment :images, :attachment
  end
end
