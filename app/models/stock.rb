class Stock < ApplicationRecord
	has_many :positions
	has_many :portfolios, through: :positions

	validates_presence_of :name, :symbol

	def current_price
		response = current_price_request
		if response.has_key?("Error Message")
			raise ArgumentError, "Stock symbol is not valid"
		else
			response["Time Series (1min)"].first[1]["4. close"]
		end
	end

	private
		def current_price_request
			uri = URI.parse("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{self.symbol}&interval=1min&apikey=#{ENV["ALPHA_VANTAGE_KEY"]}")
			request = Net::HTTP.get(uri)
			JSON.parse(request)
		end
end
