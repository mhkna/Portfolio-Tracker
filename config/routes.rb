Rails.application.routes.draw do

  resources :portfolios, only: [:new, :create, :index, :destroy, :show]

  devise_for :users

  devise_scope :user do
  	root :to => 'devise/sessions#new'
	end
	resources :stocks, except: [:show, :index]
end
