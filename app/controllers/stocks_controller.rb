class StocksController < ApplicationController
	def new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		if @stock.
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def stock_params
			params.require(:stock).permit(:name, :symbol)
		end
end
