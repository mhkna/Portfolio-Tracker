class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
    	t.integer :owned_shares, null: false
    	t.decimal :purchase_price, null: false, precision: 16, scale: 4
    	t.decimal :sale_price, precision: 16, scale: 4
    	t.integer :portfolio_id, null: false
    	t.integer :stock_id#, null: false

    	t.timestamps
    end
  end
end
