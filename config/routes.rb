Rails.application.routes.draw do
  resources :portfolios, only: [:new, :create, :index, :destroy, :show, :update, :edit] do
    resources :positions, except: [:show, :index] #mpf - I don't think we need all of the actions for portfolios, doesn't hurt anything at this point through
  end

  devise_for :users

  devise_scope :user do
  	root :to => 'devise/sessions#new'
	end

	resources :stocks, except: [:show, :index, :destroy]

end
