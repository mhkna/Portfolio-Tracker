class Position < ApplicationRecord
	belongs_to :stock
	belongs_to :portfolio

  validates_presence_of :owned_shares, :purchase_price, :portfolio_id, :stock_id

  def profit_loss
    self.stock.current_price.to_d - self.purchase_price.to_d
  end

  def percent_change
    (self.stock.current_price.to_d - self.purchase_price) / self.purchase_price * 100
  end
end
