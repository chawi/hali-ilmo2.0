class SessionsController < ApplicationController

	skip_before_filter :login_required, :set_user_variable

	def index
		
	end
	
	def new
		
	end

	def create

			#raise params.inspect
		begin 

			@user = User.authenticate(params[:user][:username],params[:user][:psword])

		rescue 

			flash[:warning] = "Tunnus/salasana virheellinen"
			redirect_to :action=>:index
			return

		end

			session[:current_user_id] = @user.id
			redirect_to courses_url
		
	end
	
	def destroy
	    # Remove the user id from the session
	    #session[:current_user_id] = nil
			reset_session	    
			redirect_to :action=>:index
	end


end
