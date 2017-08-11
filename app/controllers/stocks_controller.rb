class StocksController < ApplicationController
	def new
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		@stock.symbol.upcase!
		if @stock.is_stock_already_persisted
			status 406
			flash[:notice] = "Stock already exists"
			render 'new'
		else
			if !@stock.current_price
				flash[:notice] = "Stock symbol is invalid"
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
	end

	def edit
		@stock = Stock.find_by(id: params[:id])
		if request.xhr?
			render :json => { page: render_to_string('stocks/edit', layout: false, locals: { stock: @stock }) }
		else
			render 'edit'
		end
	end

	def update
		@stock = Stock.find_by(id: params[:id])
		@stock.update_attributes(stock_params)
		@stock.symbol.upcase!
		if !@stock.current_price
			flash[:notice] = "Stock symbol is invalid"
			render 'edit'
		else
			if @stock.save
				flash[:notice] = "Stock updated successfully"
				redirect_to portfolios_path
			else
				@errors = @stock.errors.full_messages
				render 'edit'
			end
		end
	end

	private
		def stock_params
			params.require(:stock).permit(:name, :symbol)
		end
end
