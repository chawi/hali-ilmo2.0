# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :login_required
	before_filter :set_user_variable

  def login_required
		if session[:current_user_id]
			true
		else
			flash[:warning] = "Ole hyvä ja kirjaudu"
			flash.keep
			redirect_to root_url
			false
		end
  end

  def set_user_variable
		if session[:current_user_id]
			@logged_user_id = session[:current_user_id]
			#could be prettier
			@logged_username = User.find(@logged_user_id).username
		else
			@logged_user_id = nil
			@logged_username = nil
		end
	end

end
