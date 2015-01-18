class CreateSettings < ActiveRecord::Migration
  class SettingStub < ActiveRecord::Base
    self.table_name = :settings
  end

  def change
    create_table :settings do |t|
      t.json :fields

      t.timestamps null: false
    end

    SettingStub.create!
  end
end
