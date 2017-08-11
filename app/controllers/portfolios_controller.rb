class PortfoliosController < ApplicationController
  def index
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    bounce_non_user
    @portfolio = Portfolio.new(portfolio_params)
    current_user.portfolios << @portfolio
    if @portfolio.save
    	flash[:notice] = "Portfolio added successfully"
      redirect_to @portfolio
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @positions = @portfolio.positions
  end

  def index
    @portfolios = Portfolio.all
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy
    redirect_to portfolios_path
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:portfolio_name)
  end
end
