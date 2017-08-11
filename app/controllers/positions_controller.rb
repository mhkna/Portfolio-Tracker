class PositionsController < ApplicationController
  def new
    @position = Position.new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(name: params[:position][:name], symbol: params[:position][:symbol].upcase)
    @position = Position.new(position_params)
    if !@stock.is_stock_already_persisted
      @stock.save
      @position.stock_id = @stock.id
    else
      @wanted_stock = @stock.is_stock_already_persisted
      @position.stock_id = @wanted_stock.id
    end
    @position.portfolio_id = params[:portfolio_id]
    if @position.save
    	flash[:notice] = "Position added successfully"
      redirect_to @position.portfolio
    else
      render 'new'
    end
  end

  def edit
    @position = Position.find(params[:id])
    @stock = Stock.find(@position.stock_id)
  end

  def update
    @position = Position.new(params[:id])

    if @position.update(position_params)
      redirect_to @position.portfolio
    else
      render 'edit'
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to @position.portfolio
  end

  private
    def position_params
      params.require(:position).permit(:owned_shares, :purchase_price)
    end
end

