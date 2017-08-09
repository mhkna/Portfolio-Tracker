class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def index
    @portfolios = Portfolio.all
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy
    redirect_to portfolios_path_url
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id)
  end
end
