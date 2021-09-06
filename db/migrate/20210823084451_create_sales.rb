class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.bigint :purchase_count
      t.string :merchant_address
      t.string :merchant_name
      t.boolean :last_upload

      t.timestamps
    end
  end
end
