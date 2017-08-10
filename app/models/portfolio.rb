class Portfolio < ApplicationRecord
  validates :portfolio_name, presence: true

  belongs_to :user
  has_many :positions
  has_many :stocks, through: :positions

  def total_value
    # value = 0
    #stocks.each do |stock|
      # current_stock_value = stock.owned_shared * stock.current_price (guessing name)
      # value += current_stock_value
    #end
  end

  def original_value
    # similar to above
  end


end
