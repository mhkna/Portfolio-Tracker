require 'rails_helper'

describe Stock do
	let(:stock) { Stock.new }

	describe ".current_price" do
		context "gives the current price of the stock" do
			it 'returns a string if the symbol is valid' do
				stock.symbol = "MSFT"
				expect(stock.current_price).to be_a(String)
			end

			it 'returns false when symbol is invalid' do
				stock.symbol = "1"
				expect {stock.current_price}.to be false
			end
		end
	end
end
