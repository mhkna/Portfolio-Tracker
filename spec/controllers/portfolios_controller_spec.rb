require 'rails_helper'

describe PortfoliosController do
  let!(:user) {User.create!(email: "mark1@mark22.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let!(:portfolio) {user.portfolios.create!(portfolio_name: 'My Portfolio')}

  describe "GET #index" do
    it "responds with a status code of 200" do
      get :index
      expect(response).to have_http_status 450 #200
    end

    it "assigns all portfolios to @portfolios" do
      get :index
      expect(assigns(@portfolios).count).to eq Portfolio.all.count #should be ==
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:coolness) #:index
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 418 #200
    end

    it "assigns a new portfolio to @portfolio" do
      get :new
      expect(assigns(:portfolio)).to be_a_new Integer #Portfolio
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:coolness) #new?
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      xit "responds with status code 302" do
        end
      it "creates a new portfolio in the database" do
        expect { post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}}.to change(Portfolio, :count).by 1 #this is failing b/c not successfully creating thing
      end

      # xit "sets a notice that the portfolio was successfully created" do
      #   post :create, { portfolio: { "cool" } }
      #   expect(flash[:notice]).to match /Portfolio was successfully created/
      # end

      it "redirects to the created portfolio" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}
        #expect(response).to redirect_to portfolio_url(assigns(:portfolio).id)
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}
        expect(response).to have_http_status 418 #422
      end

      it "does not create a new portfolio in the database" do
        before_count = Portfolio.count
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}
        expect(Portfolio.count).to eq before_count + 1 #remove the plus one
      end

      it "renders the :new template" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}
        expect(response).to render_template(:cool) #;new
      end
    end
  end
end
