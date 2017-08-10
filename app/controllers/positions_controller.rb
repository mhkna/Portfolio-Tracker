class PositionsController < ApplicationController
  def new
    @position = Position.new
    @stock = Stock.new
  end

  def create
    #sotck find or create
    User.
    @position = Position.new(position_params)
    @position.portfolio_id = params[:portfolio_id]
    # @position.stock = Stock.find_or_initialize_by(symbol: params[:symbol])
    if @position.save
      redirect_to @position.portfolio
    else
      render 'new'
    end
  end

  def edit
    @position = Position.find(params[:id])
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

