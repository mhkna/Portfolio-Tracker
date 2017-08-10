require 'rails_helper'

describe PortfoliosController do
  let!(:user) {User.create!(email: "mark1@mark22.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let!(:user1) {User.create!(email: "mark1@mark212.com", password: "1234567812345678123456781234567812345678123456781234567812345678") }
  let!(:portfolio) {user.portfolios.create!(portfolio_name: 'My Portfolio')}

  describe "GET #index" do
    it "responds with a status code of 200" do
      sign_in user
      get :index
      expect(response).to have_http_status 200
    end

    it "redirects to login if no user logged in" do
    end

    xit "assigns all portfolios to @portfolios" do
      get :index
      expect(assigns(@portfolios).count).to eq Portfolio.all.count # hmmmmmmm, what is this?
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new portfolio to @portfolio" do
      get :new
      expect(assigns(:portfolio)).to be_a_new Portfolio
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do #having trouble seeing what are valid params
      it "responds with status code 302" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: user.id}}
        expect(response).to have_http_status 302
        end
      it "creates a new portfolio in the database" do
        expect { post :create, params: {portfolio: {portfolio_name: "awesome", user_id: user.id}}}.to change(Portfolio, :count).by 1 #this is failing b/c not successfully creating thing
      end

      # xit "sets a notice that the portfolio was successfully created" do
      #   post :create, { portfolio: { "cool" } }
      #   expect(flash[:notice]).to match /Portfolio was successfully created/
      # end

      it "redirects to the created portfolio" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: user.id}}
        #expect(response).to redirect_to portfolio_url(assigns(:portfolio).id)
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
        post :create, params: {portfolio: {portfolio_name: "go pound sand"}}
        expect(response).to have_http_status 422
      end

      it "does not create a new portfolio in the database" do
        before_count = Portfolio.count
        post :create, params: {portfolio: {portfolio_name: "go pound sand"}}
        expect(Portfolio.count).to eq before_count
      end

      it "renders the :new template" do
        post :create, params: {portfolio: {portfolio_name: "awesome", user_id: 10}}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: portfolio.id }
      expect(response).to have_http_status 200
    end

    # it "assigns a new portfolio to @portfolio" do
    #   get :new
    #   expect(assigns(:portfolio)).to be_a_new Portfolio
    # end

    # it "renders the :new template" do
    #   get :new
    #   expect(response).to render_template(:new)
    # end
  end

  describe "POST #destroy" do
    it "blah" do
      original_count = Portfolio.all.count
      post :destroy, params: { id: portfolio.id}
      expect(Portfolio.all.count).to eq original_count - 1
    end
  end
end
