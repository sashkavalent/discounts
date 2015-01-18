class AddSheetRefAndActivePeriodToDiscounts < ActiveRecord::Migration
  def change
    add_reference :discounts, :sheet, index: true

    add_column :discounts, :active_from, :datetime
    add_column :discounts, :active_till, :datetime

    add_index :discounts, [:active_till, :active_from]
  end
end
