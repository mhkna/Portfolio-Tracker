require 'rails_helper'

describe PortfoliosController do
  let!(:user) {User.create!(email: "mark1@mark22.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let!(:portfolio) {user.portfolios.create!(portfolio_name: 'My Portfolio')}

  describe "GET #index" do
    it "responds with a status code of 200" do
      get :index
      expect(response).to have_http_status 450 #200
    end
  end
end
