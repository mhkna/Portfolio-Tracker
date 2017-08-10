class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(devise)
  	portfolios_path
	end

  def bounce_non_user
    redirect_to 'www.google.com' if !current_user
  end
end
