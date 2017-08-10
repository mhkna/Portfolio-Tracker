require 'rails_helper'

describe Portfolio do
  context 'a user is logged in' do
  let(:user) { User.new(email: "mark112@12312314.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let(:portfolio) { Portfolio.new(portfolio_name: "Cool Portfolio") }

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
    xit 'correctly sums the total value of users stocks' do
    end

    xit '' do
    end
  end

  describe "original_value" do
    xit 'correctly sums the original value of the users stocks' do

    end

  end

  describe "total_pnl" do
    xit 'correctly calculates the total value of the portfolios'
    #expect(portfolio.pnl).to eq (value)
  end
end
end
