require 'rails_helper'

describe Stock do
	let(:stock) { Stock.new }

	describe ".current_price" do
		context "returns the current price of the stock" do
			it 'will be a string if the symbol is valid' do
				stock.symbol = "MSFT"
				expect(stock.current_price).to be_a(String)
			end

			pending 'raises an error when symbol is invalid' do
				stock.symbol = "1"
				expect(stock.current_price).to raise_exception
			end
		end
	end
end
