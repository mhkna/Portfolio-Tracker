require 'rails_helper'

describe Portfolio do
  context 'a user is logged in' do
  let(:user) { User.new(email: "mark1123232@12312314.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let(:portfolio) { Portfolio.new(portfolio_name: "Cool Portfolio") }
  let(:stock1) {Stock.create!(name: "Microsoft", symbol: "MSFT")}
  let(:stock2) {Stock.create!(name: "Amazon", symbol: "AMZN")}

  describe "attributes" do
    it 'has a readable, writeable name' do
      user.portfolios << portfolio
      expect(portfolio.portfolio_name).to eq "Cool Portfolio"
      portfolio.portfolio_name = "Sweet Portfolio"
      portfolio.save
      expect(portfolio.portfolio_name).to eq "Sweet Portfolio"
    end
  end

  describe "total_value" do

    it 'returns a float' do
      user.portfolios << portfolio; s1 = 50; p1 = 1000; s2 = 60; p2 = 500; user.save
      portfolio.positions.create(owned_shares: s1, purchase_price: p1, stock_id: stock1.id)
      portfolio.positions.create(owned_shares: s2, purchase_price: p2, stock_id: stock1.id)
      expect(portfolio.total_value).to be_instance_of Float
    end

    it '' do
      user.portfolios << portfolio; s1 = 50; p1 = 1000; s2 = 60; p2 = 500; user.save
      portfolio.positions.create(owned_shares: s1, purchase_price: p1, stock_id: stock1.id)
      portfolio.positions.create(owned_shares: s2, purchase_price: p2, stock_id: stock1.id)
    end
  end

  describe "original_value" do
    it 'correctly sums the original value of the users stocks' do
      user.portfolios << portfolio; s1 = 50; p1 = 1000; s2 = 60; p2 = 500; user.save
      portfolio.positions.create(owned_shares: s1, purchase_price: p1, stock_id: stock1.id)
      portfolio.positions.create(owned_shares: s2, purchase_price: p2, stock_id: stock1.id)
      expect(portfolio.original_value).to eq (s1 * p1) + (s2 * p2)
    end

  end

  describe "total_pnl" do
    it 'returns a float' do
      user.portfolios << portfolio; s1 = 50; p1 = 1000; s2 = 60; p2 = 500; user.save
      portfolio.positions.create(owned_shares: s1, purchase_price: p1, stock_id: stock1.id)
      portfolio.positions.create(owned_shares: s2, purchase_price: p2, stock_id: stock1.id)
      expect(portfolio.total_pnl).to be_instance_of Float
    end
  end
end
end
