class StocksController < ApplicationController
	def new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		@stock.symbol.upcase!
		if @stock.is_stock_already_persisted
			status 406
			render 'new'
		else
			if @stock.save
				flash[:notice] = "Stock added successfully"
				redirect_to portfolios_path
			else
				@errors = @stock.errors.full_messages
				render 'new'
			end
		end
	end

	def edit
		@stock = Stock.find_by(id: params[:id])
	end

	def update
		@stock = Stock.find_by(id: params[:id])
		@stock.update_attributes(stock_params)
		if @stock.save
			redirect_to portfolios_path
		else
			render 'edit'
		end
	end

	private
		def stock_params
			params.require(:stock).permit(:name, :symbol)
		end
end
