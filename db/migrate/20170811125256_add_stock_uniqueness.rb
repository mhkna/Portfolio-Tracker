class AddStockUniqueness < ActiveRecord::Migration[5.1]
  def change
  	add_index :stocks, :name, unique: true
  	add_index :stocks, :symbol, unique: true
  end
end
