class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
    	t.string :name, null: false
    	t.string :symbol, null: false

    	t.timestamps
    end
  end
end
